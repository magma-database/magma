private
numberOfChildrenAtByteArrayIndex: index put: anInteger

	^byteArray
		maUint: keySize
		at: index + self numberOfChildrenEntryOffset
		put: anInteger