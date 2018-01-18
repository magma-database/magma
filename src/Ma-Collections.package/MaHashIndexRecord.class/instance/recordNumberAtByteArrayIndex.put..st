private
recordNumberAtByteArrayIndex: index put: anInteger
	^ byteArray
		maUint: SizeOfRecordNumberInBits
		at: index + self recordNumberEntryOffset
		put: anInteger