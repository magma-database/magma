private
recordNumberAtByteArrayIndex: index put: anInteger

	^byteArray
		maUint: 32
		at: index + self recordNumberEntryOffset
		put: anInteger
