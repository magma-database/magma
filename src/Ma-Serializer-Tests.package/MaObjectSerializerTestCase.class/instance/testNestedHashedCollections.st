as yet unclassified
testNestedHashedCollections
	| dict |
	dict := Dictionary new.
	50 timesRepeat:
		[ | set |
		set := ((1 to: 5) collect:
			[ : n | UUID new ]) asSet.
		dict
			at: set
			put: set.
		set := ((1 to: 15) collect:
			[ : n | UUID new ]) asSet.
		dict
			at: set
			put: set ].
	self assert: (MaObjectSerializer testMaterialize: dict) = dict