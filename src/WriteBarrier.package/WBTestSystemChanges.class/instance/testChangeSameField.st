as yet unclassified
testChangeSameField
	| c cm |
	c := self barrierClass.
	self withDefaultMethod: 'x: n x := n' on: WBMock do:
		[cm := c >> #x:.
		WBMock compile: 'x: n x := n + 1'.
		self assert: (c >> #x:) == cm]