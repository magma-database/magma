test querys - persistent empty
testPersistentEmpty
	self 
		remotePerform: #createEmpty
		in: 'client1'.
	self 
		remotePerform: #verifyEmpty
		in: 'client2'