accessing
classForId: anInteger

	^ self
		classForId: anInteger
		ifAbsent: [ self error: anInteger printString, ' is not a known class id.' ]