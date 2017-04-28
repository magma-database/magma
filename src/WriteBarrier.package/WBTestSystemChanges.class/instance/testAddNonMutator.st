as yet unclassified
testAddNonMutator
	| c md cm |
	c := self barrierClass.
	md := c methodDictionary copy.
	cm := c >> #x:.
	self withTemporaryMethod: 'q ^ 42' on: WBMock do:
		[self assert: (c >> #x:) == cm.
		self assert: md = c methodDictionary.
		self deny: (c includesSelector: #q)]