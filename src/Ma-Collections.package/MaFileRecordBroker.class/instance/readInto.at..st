record
readInto: aByteArray at: recordIndex 
	file 
		maRead: recordSize
		bytesFromPosition: 1
		of: aByteArray
		atFilePosition: (self filePositionFor: recordIndex)