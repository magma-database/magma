other small tests
testCreateMagmaCollectionAndIndexSimultaneously
	self 
		remotePerform: #createMagmaCollectionAndIndexSimultaneously
		in: 'client1'.
	self 
		remotePerform: #verifyMagmaCollectionAndIndexCreatedSimultaneously
		in: 'client2'