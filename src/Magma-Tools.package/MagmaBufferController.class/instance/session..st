initializing
session: aMagmaSession 
	session := aMagmaSession.
	aMagmaSession user ifNil: [ aMagmaSession user: (MagmaUser id: self printString) ].
	aMagmaSession
		 ensureConnected ;
		 readStrategy: (MaReadStrategy minimumDepth: 0)