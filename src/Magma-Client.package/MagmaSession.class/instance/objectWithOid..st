accessing
objectWithOid: anInteger 
	^ self 
		objectWithOid: anInteger
		ifAbsent: 
			[ MagmaInvalidOid signal: 'no object with oid ' , anInteger printString ]