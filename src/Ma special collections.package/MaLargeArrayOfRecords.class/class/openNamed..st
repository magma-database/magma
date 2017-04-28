create
openNamed: filenameString
	(StandardFileStream isAFileNamed: filenameString)
		ifFalse: [ MaEnvironmentError signal: filenameString, ' does not exist.' ].
	^ self open: (StandardFileStream fileNamed: filenameString) binary