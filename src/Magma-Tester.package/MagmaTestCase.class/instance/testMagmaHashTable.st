test MagmaHashTable
testMagmaHashTable
	self 
		remotePerform: #initializeHashTable in: 'client1' ;
		remotePerform: #verifyHashTable in: 'client2'