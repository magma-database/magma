private-querys tests
assertMc: aMagmaCollectionReader equals: anOrderedCollection 
	| sc |
	[ aMagmaCollectionReader sortComplete ] whileFalse: 
		[ self notify: 'sort is ' , (aMagmaCollectionReader fractionSorted * 100 asFloat truncateTo: 1) asString , ' complete.'.
		(Delay forSeconds: 1) wait ].
	sc := anOrderedCollection asSortedCollection: aMagmaCollectionReader sortBlock.
	self 
		verifyOrder: aMagmaCollectionReader
		against: sc