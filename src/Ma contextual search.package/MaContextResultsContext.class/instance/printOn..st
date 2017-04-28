printing
printOn: aStream

	super printOn: aStream.
	self do:
		[ : each | 
		aStream cr; maPrint: each ]