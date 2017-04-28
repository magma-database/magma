private
valueAtByteArrayIndex: anInteger

	^ byteArray 
		maUint: valueSize
		at: anInteger + self valueEntryOffset