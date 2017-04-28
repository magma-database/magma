private
readCommitRecordAt: commitNumber 
	"Answer the MaCommitLogRecord for commitNumber."
	^ session commitLogRecordAt: commitNumber