actions
validate: aMaCommitLogRecord with: aMaCommitLogEntry 
	self 
		validateCommitNumber: aMaCommitLogRecord
		with: aMaCommitLogEntry.
	self validateMagmaArrayChangesIn: aMaCommitLogEntry