validating
validateCanAdd: anObject 
	(self includes: anObject) 
		ifTrue: 
			[ MagmaDuplicateObjectInCollection signal: anObject printString , ' cannot be added to ' , self printString ]
		ifFalse: [ super validateCanAdd: anObject ]