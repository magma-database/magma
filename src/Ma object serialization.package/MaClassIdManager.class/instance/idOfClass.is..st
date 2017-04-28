building
idOfClass: aClass is: anInteger 
	mutable ifFalse: 
		[ (classesById includesKey: anInteger) ifFalse: 
			[ MaObjectSerializationUserError signal: '#protocol extension not allowed (' , aClass printString , ').' ] ].
	nextClassId := nextClassId max: anInteger.
	classesById 
		at: anInteger
		put: aClass.
	^ idsByClass 
		at: aClass
		put: anInteger