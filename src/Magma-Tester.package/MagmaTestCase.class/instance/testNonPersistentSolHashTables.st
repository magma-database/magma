test MagmaHashTable
testNonPersistentSolHashTables
	self
		 verifyNonPersistentSolHashTable:
			(SOLHashTable
				loadFactor: 1
				segBits: 2
				keyBits: 28) ;
		 verifyNonPersistentSolHashTable: MagmaSolHashTable new