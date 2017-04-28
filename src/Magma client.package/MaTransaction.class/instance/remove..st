building
remove: anObject 
	super remove: anObject.
	readSet 
		removeKey: anObject
		ifAbsent: 
			[ "do nothing"
			 ]