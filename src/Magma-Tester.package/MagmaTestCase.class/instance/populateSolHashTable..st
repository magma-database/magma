test MagmaHashTable
populateSolHashTable: aMagmaSolHashTable 
	| r largest |
	r := self random.
	largest := (1 bitShift: aMagmaSolHashTable keyBits) - 1.
	10000 timesRepeat:
		[ | n |
		n := r nextInt: largest.
		aMagmaSolHashTable
			add: n asWords
			at: n ]