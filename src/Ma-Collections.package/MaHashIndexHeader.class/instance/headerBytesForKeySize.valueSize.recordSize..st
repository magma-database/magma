accessing
headerBytesForKeySize: keySize valueSize: valueSize recordSize: hashRecordSize 
	self
		keySize: keySize ;
		valueSize: valueSize ;
		recordSize: hashRecordSize.
	^ byteArray