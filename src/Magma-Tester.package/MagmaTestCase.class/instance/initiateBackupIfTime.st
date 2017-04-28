test backup/restore
initiateBackupIfTime
	self suite initiateBackupPrereqsCompleted = self requiredPrereqsToInitiateBackup ifTrue: 
		[ self fullBackup.	
		"Prevent any other backups from being initiated."
		self suite initiateBackupPrereqsCompleted add: 'backup initiated' ]