test MagmaHashTable
verifySolHashTableWithRemovedEntries
	clientSession refresh.
	self verifySolHashTableWithRemovedEntries: (clientSession root at: #testMagmaSolHashTable)