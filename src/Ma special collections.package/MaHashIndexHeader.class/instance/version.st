accessing
version
	^ (byteArray 
		maUint: 8
		at: self positionOfVersion1Indicator) = 0 
		ifTrue: 
			[ byteArray 
				maUint: 8
				at: self positionOfVersion ]
		ifFalse: [ 1 ]