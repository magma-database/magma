accessing
open
	directory exists ifFalse: [ MagmaEnvironmentError signal: 'Database Directory Not Found' ].
	(directory fileExists: self class objectsPhysicalFilename) ifFalse: [ MagmaEnvironmentError signal: (directory fullNameFor: self class objectsPhysicalFilename) , ' not found.' ].
	self openObjectsFile.
	[ self
		 validateSignature ;
		 openFilePositionIndex ] ifCurtailed: [ self close ]