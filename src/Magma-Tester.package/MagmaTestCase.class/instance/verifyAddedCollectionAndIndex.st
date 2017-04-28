test add index and objects simultaneously
verifyAddedCollectionAndIndex
	| reader |
	clientSession abort.
	reader := (clientSession root at: 'testAddIndexAndObjectsSimultaneously') where: 
		[ : r | 
		r 
			read: #name
			from: 'A' ].
	self should: [ reader size = 1 ].
	self addVerifyRestorePrerequisite: #verifyAddedCollectionAndIndex.
	^ self calculateTimeToVerifyRestore