private
controlAtByteArrayIndex: anInteger
	^ byteArray 
		maUint: self sizeOfControlFieldInBits
		at: anInteger + self controlEntryOffset