*ma-core
maTimeStamp
	"Answer the author initials of the current version of this method."
	^ self maActualMethod ifNotNil: 
		[ : cm | 
		cm timeStamp subStrings ifNotEmptyDo: 
			[ : strings | 
			DateAndTime 
				date: strings second asDate
				time: strings third asTime ] ]