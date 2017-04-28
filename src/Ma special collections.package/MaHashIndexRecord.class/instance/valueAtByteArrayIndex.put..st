private
valueAtByteArrayIndex: index put: anInteger

	^ byteArray
		maUint: valueSize
		at: index + self valueEntryOffset
		put: anInteger