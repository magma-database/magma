as yet unclassified
testRemove
	self assert: (tree at: 'abel') = 'ABEL'.
	self assert: (tree removeKey: 'abel') = 'ABEL'.
	self assert: (tree at: 'abel' ifAbsent: [42]) = 42.
	self assert: (tree at: 'abelmosk') = 'ABELMOSK'.
	self assert: (tree removeKey: 'foo' ifAbsent: [42]) = 42.
	self assert: (tree removeKey: 'abel' ifAbsent: [42]) = 42.