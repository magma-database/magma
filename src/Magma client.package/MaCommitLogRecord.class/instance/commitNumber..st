accessing
commitNumber: anInteger 
	byteArray 
		maUint: 48
		at: self bufferPositionOfCommitNumber 
		put: anInteger