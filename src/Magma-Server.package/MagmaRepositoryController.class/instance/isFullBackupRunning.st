backup / restore
isFullBackupRunning
	^ self requestCritical: 
		[ backupProcess notNil and: [ backupProcess everStarted not or: [ backupProcess isRunning ] ] ]