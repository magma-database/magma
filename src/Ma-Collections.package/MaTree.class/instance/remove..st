building
remove: anObject
	"Removes anObject and all of its children."

	^self
		remove: anObject
		ifAbsent: [ self error: anObject printString, ' was not found in ', self printString ]
