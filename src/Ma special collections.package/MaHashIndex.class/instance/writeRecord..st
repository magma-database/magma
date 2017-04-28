private
writeRecord: aMaHashIndexRecord 
	broker 
		writeFrom: aMaHashIndexRecord byteArray
		at: aMaHashIndexRecord recordNumber