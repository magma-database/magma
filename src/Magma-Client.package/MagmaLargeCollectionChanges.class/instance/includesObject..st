testing
includesObject: anObject 
	^ self hasAdditions and: [ self added includesKey: anObject ]