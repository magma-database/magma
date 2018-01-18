as yet unclassified
testMatch
	self assert: (tree matchesForString: 'abea' distance: 1) asSet = #(ABEAM ABEAR ABED ABEL ABET ABE) asSet.
	self assert: (tree matchesForString: 'abel' distance: 2) asSet = #(ABELIA ABEAM ABEAR) asSet.
	self assert: (tree matchesForString: 'abel' distance: 0) = #(ABEL).
	self assert: (tree matchesForString: '' distance: 1) = #().
	self assert: (empty matchesForString: 'foo' distance: 0) = #()