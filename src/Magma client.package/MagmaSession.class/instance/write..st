private
write: aMaCommitLogRecord 
	"Send aMaCommitLogRecord to the repository, instructing it to write it to its logs and apply it to its persistent graph."
	"Calls write:logged:commitLogRecord:."
	self submit: 
		(MaWriteRequest new
			commitLogRecord: aMaCommitLogRecord ;
			yourself)