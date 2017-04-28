access
originalSize
	^ byteArray
		maUint: self sizeOfOriginalSizeField 
		at: self headerSize