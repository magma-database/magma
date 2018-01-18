initialize
recordSize: anInteger 
	byteArray 
		maUint: 8
		at: (self positionOfRecordSizeForVersion: self class version)
		put: anInteger