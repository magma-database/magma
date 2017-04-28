accessing
record: aByteArray size: anInteger startingAt: startPos

	self ensureCanHold: anInteger.
	byteArray
		replaceFrom: self headerSize+1
		to: self headerSize + anInteger
		with: aByteArray
		startingAt: startPos.
	self physicalSize: self headerSize + anInteger + self checkSumSize