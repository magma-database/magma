test persistent reader
verifyCollectionAndReader
	| reader |
	clientSession abort.
	reader := clientSession root at: 'testPersistentReader.reader'.
	self assert: reader notEmpty.
	self should: [ reader allSatisfy: [ : eachName | eachName key first = $M ] ].
	self addVerifyRestorePrerequisite: #verifyCollectionAndReader.
	^ self calculateTimeToVerifyRestore 