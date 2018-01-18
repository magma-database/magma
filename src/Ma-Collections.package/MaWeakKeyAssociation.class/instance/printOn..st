as yet unclassified
printOn: aStream
	self key printOn: aStream.
	aStream nextPutAll: '->'.
	self value printOn: aStream