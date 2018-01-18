private tests
verifyKeyQuantities
	self assert:
		(sortedKeys allSatisfy:
			[ : each | (self index occurrencesOf: each) = (values at: each) size ]).
	self assert:
		((sortedKeys isEmpty and: [ self index size = 0 ]) or:
			[ self index size =
				(self index
					numberOfEntriesFrom: 0
					to: sortedKeys last) ])