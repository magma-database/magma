*magma server
process
	^ endingCommitNumber 
		ifNil: [ self repository commitRecordsFrom: startingCommitNumber ]
		ifNotNil: 
			[ self repository 
				commitRecordsFrom: startingCommitNumber
				to: endingCommitNumber ]