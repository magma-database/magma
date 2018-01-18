private
readRecord: aMaHashIndexRecord at: recordIndex 
	broker 
		readInto: aMaHashIndexRecord byteArray
		at: recordIndex.
	^ aMaHashIndexRecord
		resetForNewKeyRange ;
		recordNumber: recordIndex ;
		yourself