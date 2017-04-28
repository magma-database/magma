actions
validate: aMaCommitLogRecord with: aMaCommitLogEntry 
	aMaCommitLogRecord ifNotNil: [ recoveryManager validateRecord: aMaCommitLogRecord ].
	self
		validateCommitNumber: aMaCommitLogRecord
		with: aMaCommitLogEntry.
	self validateMagmaArrayChangesIn: aMaCommitLogEntry