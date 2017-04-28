private
initializeFromHeader: aByteArray
	| header |
	header := MaHashIndexHeader new byteArray: aByteArray.
	self
		keySize: header keySize
		valueSize: header valueSize
		hashRecordSize: header recordSize.
	broker 
		headerSize: header headerSize ;
		recordSize: record bufferSize