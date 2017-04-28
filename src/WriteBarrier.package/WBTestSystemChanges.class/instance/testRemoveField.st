as yet unclassified
testRemoveField
	| c |
	c := self barrierClass.
	self assert: (c includesSelector: #y:).
	WBMock removeInstVarName: 'y'.
	c := self barrierClass.
	[self deny: (c includesSelector: #y:)]
		ensure: [WBMock addInstVarName: 'y']