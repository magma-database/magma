accessing
checkSum

	^ byteArray
		maUint: 160
		at: self checkSumPosition-1 "-1 to convert to 0-based"