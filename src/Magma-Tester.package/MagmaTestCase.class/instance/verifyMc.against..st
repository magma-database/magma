private-querys tests
verifyMc: aMagmaCollection against: anOrderedCollection 
	self 
		assertMc: aMagmaCollection
		includesAll: anOrderedCollection.
	self whereAndSelectBlockPairs do: 
		[ : eachPair | 
		self 
			verifyWhere: eachPair first
			from: aMagmaCollection
			withSelect: eachPair second
			from: anOrderedCollection ]