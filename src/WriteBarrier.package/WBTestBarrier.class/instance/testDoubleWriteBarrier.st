as yet unclassified
testDoubleWriteBarrier
	| m |
	m := WBMock new.
	self assert: m class == WBMock.
	self enableWriteBarrier: m.
	self assert: m class superclass == WBMock.
	self enableWriteBarrier: m.
	self assert: m class superclass == WBMock