as yet unclassified
testSpecies
	| array list |
	array := WordArray with: 1 with: 2 with: 3.
	list := LinkedList new add: (StackLink with: 3); yourself.
	self assert: array species == WordArray.
	self assert: list species == Array.
	self enableWriteBarrier: array.
	self enableWriteBarrier: list.
	self assert: array species == WordArray.
	self assert: list species == Array