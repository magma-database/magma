private
readRecord: aMaHashIndexRecord at: recordIndex 
	broker 
		readInto: aMaHashIndexRecord byteArray
		at: recordIndex.
	^ aMaHashIndexRecord
		cacheAttributes ;
		recordNumber: recordIndex ;
		yourself