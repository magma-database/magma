as yet unclassified
testAddMutator
	| c md cm |
	c := self barrierClass.
	md := c methodDictionary copy.
	cm := c >> #x:.
	self withTemporaryMethod: 'q ^ x := 42' on: WBMock do:
		[self assert: (c >> #x:) == cm.
		self deny: md = c methodDictionary.
		self assert: (c includesSelector: #q)]