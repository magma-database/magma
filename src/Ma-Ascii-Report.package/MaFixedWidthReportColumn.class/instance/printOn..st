printing
printOn: aStream 
	super printOn: aStream.
	self hasHeading ifTrue: 
		[ aStream
			nextPutAll: ' (' ;
			nextPutAll: self headingText ;
			nextPut: $) ]