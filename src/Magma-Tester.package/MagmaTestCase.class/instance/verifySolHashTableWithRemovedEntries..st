test MagmaHashTable
verifySolHashTableWithRemovedEntries: aMagmaSolHashTable
	| r largest |
	r := self random.
	largest := (1 bitShift: aMagmaSolHashTable keyBits) - 1.
	1
		to: 10000
		do:
			[ : c | | n |
			n := r nextInt: largest.
			c odd
				ifTrue: [ self assert: (aMagmaSolHashTable allAt: n) isEmpty ]
				ifFalse:
					[ self assert:
						((aMagmaSolHashTable allAt: n) allSatisfy:
							[ : each | each = n asWords ]) ] ]