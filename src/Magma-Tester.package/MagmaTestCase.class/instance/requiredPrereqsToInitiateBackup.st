test backup/restore
requiredPrereqsToInitiateBackup
	"To do the backup/restore test, we commence the backup only after all of my server-killing-tests are complete because otherwise the backup could be aborted in the middle."
	^ Set 
		with: #testRollbackRecovery
		with: #testForwardRecovery