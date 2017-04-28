private
warmBackupUpdatesFrom: startingCommitNumber for: backupLocation 
	"Calls commitRecordsFrom:"
	^ self submit: 
		(MaWarmBackupUpdateRequest new
			startingCommitNumber: startingCommitNumber ;
			requestingLocation: backupLocation ;
			yourself)