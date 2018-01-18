SUnit tests
allRecordsDo: twoArgBlock 
	guard critical: 
		[ self selectRoot.
		self 
			recordsFrom: record independentCopy
			do: twoArgBlock ]