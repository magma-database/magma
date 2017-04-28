accessing
valueSize
	^ self version in: 
		[ : version | 
		| modifier |
		modifier := version = 1 
			ifTrue: [ 1 ]
			ifFalse: [ 0 ].
		(byteArray 
			maUint: (self sizeOfValueSizeForVersion: version)
			at: (self positionOfValueSizeForVersion: version)) + modifier ]