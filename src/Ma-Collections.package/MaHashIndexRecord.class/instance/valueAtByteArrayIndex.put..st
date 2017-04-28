private
valueAtByteArrayIndex: index put: anInteger 
	^ byteArray
		maUint: valueSize
		at: index + ValueEntryOffset
		put: anInteger