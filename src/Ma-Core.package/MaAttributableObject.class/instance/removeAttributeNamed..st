attributes
removeAttributeNamed: aString 
	^ attributes ifNotNil: 
		[ | answer |
		answer := attributes 
			removeKey: aString
			ifAbsent: [ nil ].
		attributes ifEmpty: [ attributes := nil ].
		answer ]