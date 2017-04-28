private
checkSum: anInteger

	^ byteArray
		maUint: 160
		at: self physicalSize - self checkSumSize
		put: anInteger