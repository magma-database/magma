utilities
createNamed: filenameString bitSize: anInteger 
	| file |
	(StandardFileStream isAFileNamed: filenameString) ifTrue: [ MaEnvironmentError signal: filenameString , ' already exists.' ].
	file := StandardFileStream fileNamed: filenameString.
	(file isNil or: [ file closed ]) ifTrue: [ MaEnvironmentError signal: 'Could not create ' , filenameString ].
	^ self
		create: file
		bitSize: anInteger