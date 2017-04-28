*ma base additions
maSentSelectors
	^ self maActualMethod 
		ifNil: 
			[ #() ]
		ifNotNilDo: [ : cm | cm messages ]