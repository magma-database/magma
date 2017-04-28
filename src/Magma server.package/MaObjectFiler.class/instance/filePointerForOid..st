accessing
filePointerForOid: oidInteger 
	| answer |
	answer := filePositionIndex 
		at: (MaOidCalculator indexPositionForOid: oidInteger)
		ifAbsent: 
			[ MagmaInvalidOid signal: oidInteger printString , ' is not a valid oid.' ].
	answer = 0 ifTrue: 
		[ MagmaInvalidOid signal: oidInteger printString , ' has been reclaimed.' ].
	^ answer