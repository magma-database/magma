Tests
testDo

	| elements |
	elements := OrderedCollection new.
	medley add: 1; add: #(2 3); add: (4 to: 7); add: 8.
	medley do: [ :x | elements add: x ].

	self assert: (elements = ((1 to: 8) asOrderedCollection)).
