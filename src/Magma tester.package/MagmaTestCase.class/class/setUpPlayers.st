framework
setUpPlayers
	InitiateBackupPrereqsCompleted := Set new.
	VerifyRestorePreqreqsCompleted := Set new.
	self
		resetServerAddress ;
		addPlayerNamed: 'client1' ;
		addPlayerNamed: 'client2' ;
		addPlayerNamed: 'server' ;
		addPlayerNamed: 'server2'