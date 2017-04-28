as yet unclassified
testRemoval2
	| tree |
	tree := BTree new.
	1 to: 15 do: [:i | tree at: i put: i].
	1 to: 15 do: [:i | tree removeKey: i].
	self assert: tree isEmpty