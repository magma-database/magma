as yet unclassified
testClassChange
	| dict |
	dict := Dictionary new.
	self assert: dict class == Dictionary.
	self enableWriteBarrier: dict.
	self deny: dict class  == Dictionary.