printing
printOn: aStream

	testSelector
		ifNil: [ aStream nextPutAll: 'a', self class name ]
		ifNotNil: [ super printOn: aStream ]
