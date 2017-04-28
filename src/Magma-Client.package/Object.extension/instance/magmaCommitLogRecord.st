*magma-client
magmaCommitLogRecord
	^ self magmaSession ifNotNil: [ : sess | sess commitLogRecordAt: self magmaCommitNumber ]