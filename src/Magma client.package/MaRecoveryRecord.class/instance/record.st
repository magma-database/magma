accessing
record

	| startOfRecord |
	startOfRecord := self headerSize+1 "because bufferPositionOfRecord is 0-based".
	^ byteArray
		copyFrom: startOfRecord
		to: startOfRecord + self recordSize - 1