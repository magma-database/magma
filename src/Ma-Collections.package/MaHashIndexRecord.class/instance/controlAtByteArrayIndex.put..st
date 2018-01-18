private
controlAtByteArrayIndex: index put: anInteger
	^ byteArray 
		maUint: SizeOfControlFieldInBits
		at: index "+ ControlEntryOffset"
		put: anInteger