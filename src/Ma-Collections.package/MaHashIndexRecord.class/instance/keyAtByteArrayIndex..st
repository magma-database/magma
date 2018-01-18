accessing
keyAtByteArrayIndex: anInteger

	^byteArray
		maUint: keySize
		at: anInteger + self keyEntryOffset
