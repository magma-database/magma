test MagmaHashTable
initializeSolHashTable
	clientSession commit:
		[ clientSession root
			at: #testMagmaSolHashTable
			put: MagmaSolHashTable new ].
	clientSession commit: [ self populateSolHashTable ]