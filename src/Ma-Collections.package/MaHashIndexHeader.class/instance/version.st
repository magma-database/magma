accessing
version
	^ (byteArray byteAt: self positionOfVersion1Indicator + 1) = 0
		ifTrue: [ byteArray byteAt: self positionOfVersion + 1 ]
		ifFalse: [ 1 ]