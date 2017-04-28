test querys - persistent populated
testPersistentPopulated
	self
		remotePerform: #createPersistentPopulated
			in: 'client1' ;
		remotePerform: #updateAndVerify
			in: 'client2'