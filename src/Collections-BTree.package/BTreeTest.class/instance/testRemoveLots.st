as yet unclassified
testRemoveLots
	| tree |
	tree := BTree new.
	#(a b c d e f g h i j k l) do: [:ea | tree at: ea put: ea, '!'].
	self assert: tree size = 12.
	#(a c e g i k) shuffled do: [:ea | tree removeKey: ea].
	self assert: tree size = 6.

	self assertSorted: tree.
	self assertConsistent: tree.