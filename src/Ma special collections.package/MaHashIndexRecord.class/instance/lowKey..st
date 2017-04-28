building
lowKey: anInteger

	^byteArray
		maUint: keySize
		at: 0
		put: anInteger
