as yet unclassified
testRemoveAll
	| tree |
	tree := BTree new.
	#(a b c d e f g h i j k l) do: [:ea | tree at: ea put: ea, '!'].
	self assert: tree size = 12.
	#(a b c d e f g h i j k l)  shuffled do: [:ea | tree removeKey: ea].
	self assert: tree size = 0.

	self assertSorted: tree.
	self assertConsistent: tree.