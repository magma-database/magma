private tests
verifyKeys

	self should: [ self indexKeys maMatchesElementsOf: sortedKeys ]
