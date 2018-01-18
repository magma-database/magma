Tests
testCopy

	| duplicate |
	medley add: 1; add: #(2 3); add: (4 to: 7); add: 8.
	duplicate := medley copy.

	self 
		assert: (medley size = duplicate size);
		assert: (medley collections = duplicate collections);
		deny: (medley collections == duplicate collections).