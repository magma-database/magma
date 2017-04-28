private tests
verifyKeyQuantities

	self should:
		[ sortedKeys allSatisfy: [ :each | (self index occurrencesOf: each) = (values at: each) size ] ].
	self should:
		[ self index size = (
			self index
				numberOfEntriesFrom: 0
				to: sortedKeys last) ]
