initialize
setIndex: aMagmaCollectionIndex 
	index := aMagmaCollectionIndex.
	table := MagmaSolHashTable
		loadFactor: 4
		segBits: 28
		keyBits: aMagmaCollectionIndex keySize