private-querys tests
verifyOrder: aMagmaCollectionReader against: aSortedCollection 
	self assert: aMagmaCollectionReader size = aSortedCollection size.
	self assert: (aMagmaCollectionReader asArray: aMagmaCollectionReader lastKnownSize) = aSortedCollection asArray