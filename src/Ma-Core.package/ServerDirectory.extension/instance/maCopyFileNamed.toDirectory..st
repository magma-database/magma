*ma-core
maCopyFileNamed: sourceFilename toDirectory: aFileDirectory 
	| sourceStream |
	sourceStream := (self readOnlyFileNamed: sourceFilename) binary.
	^ [ aFileDirectory 
		putFile: sourceStream
		named: (aFileDirectory localNameFor: sourceFilename) ]

		ensure: [ sourceStream close ]