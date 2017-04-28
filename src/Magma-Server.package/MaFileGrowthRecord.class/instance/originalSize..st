access
originalSize: anInteger
	^ byteArray
		maUint: self sizeOfOriginalSizeField 
		at: self headerSize
		put: anInteger