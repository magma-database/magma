attributes
attributeNamed: aString put: anObject 
	anObject ifNotNil: [ attributes ifNil: [ attributes := Dictionary new ] ].
	^ anObject
		ifNil:
			[ self removeAttributeNamed: aString.
			anObject ]
		ifNotNil:
			[ attributes
				at: aString
				put: anObject ]