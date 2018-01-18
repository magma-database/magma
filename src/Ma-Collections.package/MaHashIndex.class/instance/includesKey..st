testing
includesKey: anInteger 
	^ guard critical: 
		[ self selectFirstRecordWithKeyEqualOrGreaterThan: anInteger.
		record hasEntryForKey: anInteger ]