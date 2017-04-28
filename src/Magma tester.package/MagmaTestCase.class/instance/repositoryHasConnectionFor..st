test misbehaving client
repositoryHasConnectionFor: sessionId 
	^ (magmaConsole controller repository 
		sessionWithId: sessionId
		ifAbsent: [ nil ]) notNil