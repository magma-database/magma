private
numberOfChildrenAtByteArrayIndex: anInteger

	^byteArray
		maUint: keySize
		at: anInteger + self numberOfChildrenEntryOffset
