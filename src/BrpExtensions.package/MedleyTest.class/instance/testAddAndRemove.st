Tests
testAddAndRemove

	| size |
	size := medley size.
	medley add: 1.
	self assert: (medley size = (size + 1)).
	medley remove: 1 ifAbsent: [].
	self assert: (medley size = size).

	medley add: 1; add: #(2 3); add: (4 to: 7); add: 8.
	self assert: (medley size = (size + 8)).

	medley remove: #(2 3).
	self assert: (medley size = (size + 8 - 2)).

	self should: [ medley remove: 0 ] raise: Error.

	medley add: #(11 12); add: (13 to: 16).
	size := medley size.
	medley remove: 12; remove: 15.
	self 
		assert: (medley size = (size - 2));
		deny: (medley includes: 12);
		deny: (medley includes: 15).

	
