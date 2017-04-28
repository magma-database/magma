as yet unclassified
testRemoveAllFailing
	| tree |
	tree := BTree new.
	#(a b c d e f g h i j k l) do: [:ea | tree at: ea put: ea, '!'].
	self assert: tree size = 12.
	#(#c #j #g #i #k #l #f #e #d #h #a #b) do: [:ea | tree removeKey: ea].
	self assert: tree size = 0.

	self assertSorted: tree.
	self assertConsistent: tree.