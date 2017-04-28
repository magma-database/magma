create
openNamed: filenameString 
	| file |
	(StandardFileStream isAFileNamed: filenameString) ifFalse: [ MaEnvironmentError signal: filenameString , ' does not exist.' ].
	file := StandardFileStream fileNamed: filenameString.
	(file isNil or: [ file closed ]) ifTrue: [ MaEnvironmentError signal: 'Could not create ' , filenameString ].
	^ self open: file binary