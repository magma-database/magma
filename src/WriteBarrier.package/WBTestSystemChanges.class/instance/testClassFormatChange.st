as yet unclassified
testClassFormatChange
	| oldFmt c |
	oldFmt := WBMock format.
	c := self barrierClass.
	self assert: c format = WBMock format.
	WBMock addInstVarName: 'foo'.
	c := self barrierClass.
	[self deny: WBMock format = oldFmt.
	self assert: c format = WBMock format]
		ensure: [WBMock removeInstVarName: 'foo']