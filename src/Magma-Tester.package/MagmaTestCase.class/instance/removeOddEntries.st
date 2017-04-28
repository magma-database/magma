test MagmaHashTable
removeOddEntries
	clientSession
		 refresh ;
		 commit: [ self removeOddEntries: (clientSession root at: #testMagmaSolHashTable) ]