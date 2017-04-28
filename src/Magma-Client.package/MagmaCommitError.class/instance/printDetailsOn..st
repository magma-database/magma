printing
printDetailsOn: aStream 
	super printDetailsOn: aStream.
	result ifNotNil: [ result printDetailsOn: aStream ]