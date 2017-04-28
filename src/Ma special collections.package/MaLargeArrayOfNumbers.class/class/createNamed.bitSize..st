utilities
createNamed: filenameString bitSize: anInteger
	(StandardFileStream isAFileNamed: filenameString)
		ifTrue: [ MaEnvironmentError signal: filenameString, ' already exists.' ].
	^ self
		create: (StandardFileStream fileNamed: filenameString) binary
		bitSize: anInteger