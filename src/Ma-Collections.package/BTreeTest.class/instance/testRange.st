as yet unclassified
testRange
	| tree keys |
	tree := BTree new.
	1 to: 100 by: 2 do: [:ea | tree at: ea put: ea * 2].
	self assert: tree size = 50.
	keys := OrderedCollection new.
	tree from: 12 to: 19 keysAndValuesDo:
		[:k :v |
		self assert: k * 2 = v.
		keys add: k].
	self assert: keys asArray = #(13 15 17 19).
	self assertSorted: tree.
	self assertConsistent: tree.