attributes
hasAttributeNamed: aString 
	^ attributes 
		ifNil: [ false ]
		ifNotNil: [ attributes includesKey: aString ]