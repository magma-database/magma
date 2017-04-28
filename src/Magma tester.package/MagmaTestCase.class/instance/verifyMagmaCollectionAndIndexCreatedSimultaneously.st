other small tests
verifyMagmaCollectionAndIndexCreatedSimultaneously
	clientSession abort.
	self should: 
		[ (clientSession root at: 'testCreateMagmaCollectionAndIndexSimultaneously') indexes notEmpty ]