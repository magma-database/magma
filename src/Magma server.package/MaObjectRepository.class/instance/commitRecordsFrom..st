client-requests
commitRecordsFrom: startNumber 
	"Answer a collection of MaCommitLogEntry which clients use to advance their image."
	^ self 
		commitRecordsFrom: startNumber
		to: 281474976710655	"The maximum possible commitNumber."