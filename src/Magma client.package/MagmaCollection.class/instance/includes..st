testing
includes: anObject

	(changes includesObject: anObject) ifTrue: [ ^true ].
	session isNil ifTrue: [ ^false ].
	^(self occurrencesOf: anObject) > 0