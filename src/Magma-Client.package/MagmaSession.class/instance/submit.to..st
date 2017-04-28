private
submit: aMagmaRepositoryRequest to: aMaServerLink 
	"Submit aMagmaRepositoryRequest and answer the result.  This is a core method."
	^ guard critical:
		[ aMagmaRepositoryRequest waitCursor showWhile:
			[ | retries link result priorLink newLink |
			retries := 0.
			link := aMaServerLink.
			[ aMagmaRepositoryRequest requiresConnection ifTrue:
				[ [ self ensureConnected ; ensureConnected ]
					on: MagmaLinkChange
					do:
						[ : noti | link := noti linkToReplace: link.
						noti resume ] ].
			aMagmaRepositoryRequest prepareToSubmitFor: self.
			link timeoutSeconds:
				(aMagmaRepositoryRequest timesToRetry > 0
					ifTrue: [ self retrySeconds + (self retrySeconds * retries) ]
					ifFalse: [ self timeoutSeconds ]).
			result := link submit: aMagmaRepositoryRequest.
			result maIsException ifTrue: [ self signalExceptionLike: result ] ]
				maOn: ConnectionTimedOut
				do:
					[ : err | "This occurs whenever we successfully sent a request out, but did not get a response back within the timeout period."
					MagmaNotification signal: err asString , '.  Retry ' , retries asString , ' of ' , aMagmaRepositoryRequest timesToRetry asString , '.'.
					retries >= aMagmaRepositoryRequest timesToRetry
						ifTrue: [ err pass ]
						ifFalse:
							[ retries := retries + 1.
							err retry ] ]
				on: ConnectionClosed , MagmaSessionLost
				do:
					[ : err |
					MagmaNotification signal: err asString , '.  Retrying unconditionally.'.
					"It could just be that the server simply expired this session.  Try to reconnect to the same server."
					aMagmaRepositoryRequest isConnect ifFalse: [ self disconnect ].
					"Don't retry a begin, because we already restore transaction on the server as part of the connection process."
					aMagmaRepositoryRequest isBegin
						ifTrue:
							[ MagmaNotification signal: err asString , '.  Reconnecting and restoring transaction...'.
							self ensureConnected.
							nil ]
						ifFalse:
							[ MagmaNotification signal: err asString , '.  Retrying ' , aMagmaRepositoryRequest asString , ' unconditionally.'.
							err retry ] ]
				on: ConnectionRefused
				do:
					[ : err | aMagmaRepositoryRequest isConnect ifFalse: [ self disconnect ].
					priorLink := link.
					newLink := self handleFailedLink: link.
					"The server is down.  If we are HA, try another server."
					newLink = priorLink
						ifTrue:
							[ MagmaNotification signal: err asString , '.  Backup server unavailable.'.
							err pass ]
						ifFalse:
							[ MagmaNotification signal: err asString , '.  Retrying at ' , newLink asString.
							aMagmaRepositoryRequest failedLocation: (MagmaRemoteLocation location: priorLink location).
							link := newLink.
							(MagmaLinkChange
								oldLink: priorLink
								newLink: newLink) signal.
							err retry ] ].
			(result isMagmaServerResult and: [ result hasServerNotifications ]) ifTrue: [ self handleSpecialOidNotifications: result serverNotifications ].
			result ] ]