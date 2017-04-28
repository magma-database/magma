accessing
recordNumberAtByteArrayIndex: anInteger

	^byteArray 
		maUint: 32
		at: anInteger + self recordNumberEntryOffset
