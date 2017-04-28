as yet unclassified
testRemoval
	| tree |
	tree := BTree new.
	#(a b c d e f g h i j k l) do: [:ea | tree at: ea put: ea, '!'].
	self assert: tree size = 12.
	tree removeKey: #d.
	self assert: tree size = 11.
	self assert: (tree at: #d ifAbsent: [32]) = 32.
	tree removeKey: #k.
	self assert: tree size = 10.
	self assert: (tree at: #k ifAbsent: [32]) = 32.
	self assertSorted: tree.
	self assertConsistent: tree.