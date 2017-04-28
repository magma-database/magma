private
submit: aMagmaRepositoryRequest to: aMaServerLink 
	"Submit aMagmaRepositoryRequest and answer the result.  This is a core method."
	^ guard critical: 
		[ aMagmaRepositoryRequest waitCursor showWhile: 
			[ | didTry link result |
			didTry := false.
			link := aMaServerLink.
			
			[ aMagmaRepositoryRequest requiresConnection ifTrue: [ self ensureConnected ].
			aMagmaRepositoryRequest prepareToSubmitFor: self.
			result := link submit: aMagmaRepositoryRequest.
			result maIsException ifTrue: [ self signalExceptionLike: result ] ] 
				maOn: MagmaSessionLost
				do: 
					[ : err | 
					MagmaNotification signal: 'MagmaSessionLost'.
					self disconnect.
					didTry 
						ifTrue: [ err pass ]
						ifFalse: 
							[ didTry := true.
							err retry ] ]
				on: NetworkError
				do: 
					[ : err | 
					(didTry or: [ aMagmaRepositoryRequest canRetry not ]) 
						ifTrue: [ err pass ]
						ifFalse: 
							[ aMagmaRepositoryRequest isConnect ifFalse: [ self disconnect ].
							(allowFailover and: [ self isLocal not ]) ifTrue: 
								[ self node ifNotNilDo: 
									[ : node | 
									aMagmaRepositoryRequest failedLocation: (MagmaRemoteLocation location: aMaServerLink location) ].
								link := self handleFailedLink: aMaServerLink ].
							didTry := true.
							err retry ] ].
			(result isMagmaServerResult and: [ result hasServerNotifications ]) ifTrue: [ self handleSpecialOidNotifications: result serverNotifications ].
			result ] ]