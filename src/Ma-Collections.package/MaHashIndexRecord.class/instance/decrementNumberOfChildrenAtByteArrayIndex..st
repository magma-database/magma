building
decrementNumberOfChildrenAtByteArrayIndex: anInteger
	| currentNumberOfChildren |
	currentNumberOfChildren := self numberOfChildrenAtByteArrayIndex: anInteger.
	currentNumberOfChildren = 0 ifTrue: [MaSoftwareError signal].
	self
		numberOfChildrenAtByteArrayIndex: anInteger
		put: currentNumberOfChildren - 1