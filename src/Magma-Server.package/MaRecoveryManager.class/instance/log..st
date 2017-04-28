commit-packages
log: aMaCommitLogRecord 
	"In case a MaCommitLogRecordRequest had come in and repositioned the file-pointer of the commitLogFile, just ensure it is setToEnd before appending the next commit.  This does *not* belong in #writeTo: because that would cause the applied.images file to grow endlessly."
	self commitLogFile setToEnd.
	aMaCommitLogRecord writeTo: self commitLogFile.
	self commitLogFile flush.
	self timeToStartNewCommitLog ifTrue: [ self archiveCommitLog ]