record
writeFrom: aByteArray at: recordIndex 
	file 
		maWrite: recordSize
		bytesFromPosition: 1
		of: aByteArray
		atFilePosition: (self filePositionFor: recordIndex)