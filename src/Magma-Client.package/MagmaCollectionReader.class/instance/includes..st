testing
includes: anObject
	(collection includes: anObject) ifFalse: [ ^ false ].
	^ expression evaluate: anObject