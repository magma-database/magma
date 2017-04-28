client-requests
commitRecordAt: startNumber 
	"Answer the CommitLogRecord for startNumber."
	^ (self 
		commitRecordsFrom: startNumber
		to: startNumber) ifNotEmptyDo: [ : arr | arr first ]