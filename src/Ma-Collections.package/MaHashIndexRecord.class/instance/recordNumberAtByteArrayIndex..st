accessing
recordNumberAtByteArrayIndex: anInteger 
	^ byteArray
"		maUint: SizeOfRecordNumberInBits"
		maUnsigned32At: anInteger + self recordNumberEntryOffset + 1