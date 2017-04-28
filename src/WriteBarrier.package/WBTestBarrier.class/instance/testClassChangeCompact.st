as yet unclassified
testClassChangeCompact
	| arr |
	arr := WordArray with: 37.
	self assert: arr class == WordArray.
	self enableWriteBarrier: arr.
	self deny: arr class  == WordArray