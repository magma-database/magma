test stale collections
verifyMagmaCollection
	Smalltalk garbageCollect.
	self assert: (localRoot at: 'testStaleCollections') asArray asSet = MaTestCase withAllSubclasses asSet