connections
connect: aMagmaUser 
	self isConnected ifTrue: [ MagmaUserError signal: 'Already connected.' ].
	guard critical: 
		[ user := aMagmaUser.
		self primConnect.
		self isServerSession ifFalse: 
			[ (ConnectedSessions includes: self) ifFalse: 
				[ ConnectedSessions
					add: self ;
					changed ] ] ]