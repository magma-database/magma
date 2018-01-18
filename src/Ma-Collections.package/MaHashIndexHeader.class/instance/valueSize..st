initialize
valueSize: anInteger 
	byteArray 
		maUint: 16
		at: (self positionOfValueSizeForVersion: self class version)
		put: anInteger