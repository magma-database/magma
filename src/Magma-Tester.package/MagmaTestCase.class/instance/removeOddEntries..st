test MagmaHashTable
removeOddEntries: aMagmaSolHashTable
	| r largest |
	r := self random.
	largest := (1 bitShift: aMagmaSolHashTable keyBits) - 1.
	1
		to: 10000
		do:
			[ : c | | n |
			n := r nextInt: largest.
			c odd ifTrue:
				[ aMagmaSolHashTable
					remove: n asWords
					at: n
					ifAbsent: [ self error: 'expected to remove' ] ] ]