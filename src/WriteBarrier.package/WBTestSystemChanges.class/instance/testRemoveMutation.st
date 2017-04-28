as yet unclassified
testRemoveMutation
	| c |
	c := self barrierClass.
	self withDefaultMethod: 'x: n x := n' on: WBMock do:
		[self assert: (c includesSelector: #x:).
		WBMock compile: 'x: n ^ 42'.
		self deny: (c includesSelector: #x:)]