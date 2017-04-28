test MagmaHashTable
verifySolHashTable: aMagmaSolHashTable
	| r largest |
	r := self random.
	largest := (1 bitShift: aMagmaSolHashTable keyBits) - 1.
	10000 timesRepeat:
		[ | n | self assert:
			((aMagmaSolHashTable allAt: (n := r nextInt: largest)) allSatisfy:
				[ : each | each = n asWords ]) ]