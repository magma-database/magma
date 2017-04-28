private
controlAtByteArrayIndex: index put: anInteger
	^ byteArray 
		maUint: self sizeOfControlFieldInBits
		at: index + self controlEntryOffset
		put: anInteger