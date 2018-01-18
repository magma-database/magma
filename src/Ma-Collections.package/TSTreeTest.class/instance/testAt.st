as yet unclassified
testAt
	self assert: (tree at: 'abear') = 'ABEAR'.
	self assert: (tree at: 'abelmosk') = 'ABELMOSK'.
	self assert: (tree at: 'abracadabra' ifAbsent: [42]) = 42.
	self assert: (tree at: '' ifAbsent: [42]) = 42.
	self assert: (empty at: 'foo' ifAbsent: [42]) = 42 