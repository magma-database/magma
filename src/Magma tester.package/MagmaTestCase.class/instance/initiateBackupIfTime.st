test backup/restore
initiateBackupIfTime
	InitiateBackupPrereqsCompleted = self requiredPrereqsToInitiateBackup ifTrue: 
		[ self fullBackup.	
		"Prevent any other backups from being initiated."
		InitiateBackupPrereqsCompleted add: 'backup initiated' ]