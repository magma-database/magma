as yet unclassified
testChangeDifferentField
	| c cm |
	c := self barrierClass.
	self withDefaultMethod: 'x: n x := n' on: WBMock do:
		[cm := c >> #x:.
		WBMock compile: 'x: n y := n'.
		self deny: (c >> #x:) == cm]