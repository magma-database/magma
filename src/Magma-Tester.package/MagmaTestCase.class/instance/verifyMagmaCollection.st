test stale collections
verifyMagmaCollection
	| persistent compare |
	Smalltalk garbageCollect.
	compare := MaTestCase withAllSubclasses asSet.
	persistent := localRoot at: 'testStaleCollections'.
	self
		 assert: persistent asArray asSet = compare ;
		 assert: compare size = persistent size ;
		 assert: (persistent count: [ : each | true ]) = persistent size