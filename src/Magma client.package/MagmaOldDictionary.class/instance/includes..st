testing
includes: anObject 
	(changes includesObject: anObject) ifTrue: [ ^ true ].
	session isNil ifTrue: [ ^ false ].
	self do:
		[ : each | each = anObject ifTrue: [ ^ true ] ].
	^ false