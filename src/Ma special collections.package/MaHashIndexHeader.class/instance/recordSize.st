accessing
recordSize
	^ byteArray 
		maUint: 8
		at: (self positionOfRecordSizeForVersion: self version)