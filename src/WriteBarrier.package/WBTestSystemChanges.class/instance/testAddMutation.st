as yet unclassified
testAddMutation
	| c |
	c := self barrierClass.
	self withDefaultMethod: 'y ^ y' on: WBMock do:
		[self deny: (c includesSelector: #y).
		WBMock compile: 'y ^ y ifNil: [y := 37]' classified: 'accessing'.
		self assert: (c includesSelector: #y)]