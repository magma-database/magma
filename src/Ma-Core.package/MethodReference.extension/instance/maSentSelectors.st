*ma-core
maSentSelectors
	^ self maActualMethod 
		ifNil: 
			[ #() ]
		ifNotNilDo: [ : cm | cm messages ]