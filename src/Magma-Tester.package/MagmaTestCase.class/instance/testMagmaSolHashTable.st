test MagmaHashTable
testMagmaSolHashTable
	self
		
		remotePerform: #initializeSolHashTable
		in: 'client1' ;
		
		remotePerform: #verifySolHashTable
		in: 'client2' ;
		
		remotePerform: #removeOddEntries
		in: 'client2' ;
		
		remotePerform: #verifySolHashTableWithRemovedEntries
		in: 'client1'