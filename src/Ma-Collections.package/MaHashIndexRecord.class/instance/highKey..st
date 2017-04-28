building
highKey: anInteger

	^byteArray
		maUint: keySize
		at: (keySize / 8)
		put: anInteger
