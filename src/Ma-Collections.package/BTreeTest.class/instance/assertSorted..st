as yet unclassified
assertSorted: aTree
	| last |
	last := nil.
	aTree keysAndValuesDo:
		[:k :v |
		last ifNotNil: [self assert: last < k].
		last := k]