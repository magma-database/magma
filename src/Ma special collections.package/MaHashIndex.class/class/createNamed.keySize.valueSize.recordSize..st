creation
createNamed: filenameString keySize: numberOfBitsInteger valueSize: valueSize recordSize: entriesInteger
	(StandardFileStream isAFileNamed: filenameString)
		ifTrue: [ MaEnvironmentError signal: filenameString, ' already exists.' ].
	^ self
		create: (StandardFileStream fileNamed: filenameString) binary
		keySize: numberOfBitsInteger
		valueSize: valueSize
		recordSize: entriesInteger