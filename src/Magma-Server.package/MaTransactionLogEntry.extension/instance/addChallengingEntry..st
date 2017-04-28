*magma-server
addChallengingEntry: aMaCommitLogEntry
	challengingEntries add: aMaCommitLogEntry.
	self connection addChallengingBytes: aMaCommitLogEntry bytesConsumed