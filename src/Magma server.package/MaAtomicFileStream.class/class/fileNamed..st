create
fileNamed: filenameString 
	^ self new
		filename: filenameString ;
		initializeStreamsAndSizes ;
		yourself