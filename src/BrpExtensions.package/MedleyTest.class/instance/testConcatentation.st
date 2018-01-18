Tests
testConcatentation

	| concat appendix |
	medley add: 1; add: #(2 3); add: (4 to: 7); add: 8.
	appendix := #(9 10 11).
	concat := medley , appendix.

	self 
		assert: (concat size = (medley size + appendix size)).
