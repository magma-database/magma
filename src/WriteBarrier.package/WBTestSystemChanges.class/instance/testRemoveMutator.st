as yet unclassified
testRemoveMutator
	| c |
	c := self barrierClass.
	self withDefaultMethod: 'x: n x := n' on: WBMock do:
		[self assert: (c includesSelector: #x:).
		WBMock removeSelector: #x:.
		self deny: (c includesSelector: #x:)]