accessing
commitNumber
	^ byteArray 
		maUint: 48
		at: self bufferPositionOfCommitNumber 