overriding
openIndex: aString 
	^ MaHashIndex open: ((MaAtomicFileStream fileNamed: aString)
			pool: repository filePool ;
			yourself)