initialize
keySize: anInteger 
	byteArray 
		maUint: 16
		at: (self positionOfKeySizeForVersion: self class version)
		put: anInteger