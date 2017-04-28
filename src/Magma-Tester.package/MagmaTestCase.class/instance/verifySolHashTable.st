test MagmaHashTable
verifySolHashTable
	clientSession refresh.
	self verifySolHashTable: (clientSession root at: #testMagmaSolHashTable)