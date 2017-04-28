test persistent reader
testPersistentReader
	self 
		remotePerform: #createCollectionAndReader
		in: 'client1'.
	timeToVerifyRestore := self 
		remotePerform: #verifyCollectionAndReader
		in: 'client2'