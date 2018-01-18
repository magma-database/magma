attributes
attributeNamed: aString 
	^ attributes ifNotNil: 
		[ attributes 
			at: aString
			ifAbsent: [ nil ] ]