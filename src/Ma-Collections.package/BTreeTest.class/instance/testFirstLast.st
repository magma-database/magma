as yet unclassified
testFirstLast
	| tree |
	tree := BTree new.
	self should: [ tree first ] raise: Error.
	self should: [ tree last ] raise: Error.
	tree at: SmallInteger minVal put: SmallInteger minVal.
	tree at: SmallInteger maxVal put: SmallInteger maxVal.
	10000 timesRepeat: [ 
		tree at: 536870911 atRandom put: nil.
		self assert: tree first = SmallInteger minVal.
		self assert: tree last = SmallInteger maxVal ]