as yet unclassified
testClassFormatChangeWithInstance
	| instance instance2 |
	instance := WBMock new.
	instance2 := WBMock new.
	barrier add: instance.
	instance y: 42.
	instance2 y: 23.
	WBMock removeInstVarName: 'x'.
	[self assert: instance2 y = 23.
	self assert: instance y = 42]
		ensure: [Object subclass: #WBMock
	instanceVariableNames: 'x y'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'WriteBarrier-Tests']