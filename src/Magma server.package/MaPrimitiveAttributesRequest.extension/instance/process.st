*magma server
process
	^ self repository primitiveAttributes
		at: #oidCount
			put: repositoryController oidCount ;
		at: #isFullBackupRunning
			put: repositoryController isFullBackupRunning ;
		yourself