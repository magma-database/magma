test MagmaHashTable
initializeHashTable
	| hashTable |
	clientSession begin.
	clientSession root
		at: #testMagmaHashTable
		put: (hashTable := MagmaHashTable index: (MaDateAndTimeIndex attribute: #key)).
	self assert: hashTable isEmpty.
	self
		 populateHashTable ;
		 verifyHashTable.
	clientSession commit