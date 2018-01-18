building
oidOf: anObject is: anInteger 
	objects 
		at: anInteger
		put: anObject.
	^ oids 
		at: anObject
		put: anInteger