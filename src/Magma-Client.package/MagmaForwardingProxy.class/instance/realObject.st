private
realObject
	^ cachedObject ifNil:
		[ | existing |
		existing := [ self remoteSession
			ifNil: [ MagmaEnvironmentError signal: 'Could not create a session to remote object.' ]
			ifNotNil:
				[ : sess | sess
					objectWithOid: self fpRemoteOid
					ifAbsent: [ MagmaGarbageCollectedObject signal: 'This object has been dereferenced and subsequently garbage collected.' ] ] ]
			on: MagmaUserRequiredNotification
			do:
				[ : noti | noti resume:
					(MagmaUser id:
						(self magmaSession
							ifNil: [ 'auto-created session to materialize ' , self fpRemoteOid asString ]
							ifNotNil:
								[ : sess | sess userId ifNil: [ 'reconnected session' ] ])) ].
		self remoteSession magmaId = magmaId ifFalse: [ MagmaEnvironmentError signal: 'Wrong db for remote object.' ].
		existing maIsForwardingProxy ifTrue: [ MagmaSoftwareError signal: 'A ForwardingProxy should not reference a ForwardingProxy.' ].
		cachedObject := existing ]