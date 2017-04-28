accessing
commitNumber
	^ byteArray maUnsigned48At: self bufferPositionOfCommitNumber + 1