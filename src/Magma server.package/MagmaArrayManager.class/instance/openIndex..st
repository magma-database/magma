initializing
openIndex: filenameString 
	^ MaLargeArrayOfNumbers open: ((MaAtomicFileStream fileNamed: filenameString)
			pool: repository filePool ;
			yourself)