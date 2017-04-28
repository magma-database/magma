initialize-release
primDisconnect
	"Calls removeSessionFor:"
	guard critical: 
		[ self isConnected ifTrue: 
			[ MagmaNotification signal: 'disconnecting from ' , self linkInformation.
			self linksDo: 
				[ : eachLink | 
				"Make reasonable attempt to clean my resources from server, if established."
				(eachLink isConnected and: [ eachLink protocolEstablished ]) ifTrue: 
					[ self 
						submit: MaRepositoryDisconnectRequest new
						to: eachLink ].
				eachLink disconnect ].
			id := nil.
			self cleanUp
			"The following commented out because now we keep transactions active!"
			"			resetTransactionLevel ;" ].
		self
			releaseSystemChangeNotifications ;
			releaseActionMap
		"			cleanUpWriteBarrier ;" ]