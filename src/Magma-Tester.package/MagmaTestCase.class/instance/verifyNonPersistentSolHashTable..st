test MagmaHashTable
verifyNonPersistentSolHashTable: aSOLHashTable
	self
		 populateSolHashTable: aSOLHashTable ;
		 verifySolHashTable: aSOLHashTable ;
		 removeOddEntries: aSOLHashTable ;
		 verifySolHashTableWithRemovedEntries: aSOLHashTable