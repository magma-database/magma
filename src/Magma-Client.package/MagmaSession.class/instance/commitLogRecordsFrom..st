private
commitLogRecordsFrom: startingCommitNumber 
	"Calls commitRecordsFrom:"
	^ self secondarySubmit: 
		(MaCommitLogRecordRequest new
			startingCommitNumber: startingCommitNumber ;
			yourself)