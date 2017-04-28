private
newHeaderBytes
	^ MaHashIndexHeader new 
		headerBytesForKeySize: keySize
		valueSize: valueSize
		recordSize: hashRecordSize