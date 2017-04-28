test backup/restore
verifyRestorePreqreqsCompleted
	^ VerifyRestorePreqreqsCompleted ifNil: [ VerifyRestorePreqreqsCompleted := Set new ]