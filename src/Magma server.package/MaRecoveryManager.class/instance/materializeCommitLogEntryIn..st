recover
materializeCommitLogEntryIn: aMaCommitLogRecord 
	^ serializer resetOidManager materializeGraph: aMaCommitLogRecord record