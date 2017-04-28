as yet unclassified
testMissing
	| tree |
	tree := BTree new.
	tree at: 1 put: 'foo'.
	tree at: 2 put: 'bar'.
	self assert: (tree at: 1 ifAbsent: [42]) = 'foo'.
	self assert: (tree at: 2 ifAbsent: [42]) = 'bar'.
	self assert: (tree at: 3 ifAbsent: [42]) = 42.