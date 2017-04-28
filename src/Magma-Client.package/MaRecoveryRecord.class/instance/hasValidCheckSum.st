testing
hasValidCheckSum
	^ self checkSumPosition > self headerSize and: [ self calculatedCheckSum = self checkSum ]