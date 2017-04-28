building
keyAtByteArrayIndex: index put: anInteger

	^byteArray
		maUint: keySize
		at: index + self keyEntryOffset
		put: anInteger
