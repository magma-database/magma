*ma-core
maSentSelectors
	^ self maActualMethod 
		ifNil: 
			[ #() ]
		ifNotNil: [ : cm | cm messages ]