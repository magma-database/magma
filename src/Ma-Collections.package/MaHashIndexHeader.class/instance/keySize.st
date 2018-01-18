accessing
keySize
	^ self version in: 
		[ : version | 
		| modifier |
		modifier := version = 1 
			ifTrue: [ 1 ]
			ifFalse: [ 0 ].
		(byteArray 
			maUint: (self sizeOfKeySizeForVersion: version)
			at: (self positionOfKeySizeForVersion: version)) + modifier ]