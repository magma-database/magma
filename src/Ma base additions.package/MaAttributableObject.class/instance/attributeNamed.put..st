attributes
attributeNamed: aString put: anObject 
	attributes ifNil: [ attributes := Dictionary new ].
	^ anObject 
		ifNil: 
			[ attributes 
				removeKey: aString
				ifAbsent: [ nil ] ]
		ifNotNil: 
			[ attributes 
				at: aString
				put: anObject ]