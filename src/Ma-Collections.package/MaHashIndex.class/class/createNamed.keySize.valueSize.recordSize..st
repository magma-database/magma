creation
createNamed: fileReference keySize: numberOfBitsInteger valueSize: valueSize recordSize: entriesInteger 
	| fileRef file |
	
	fileRef := fileReference asFileReference.
	fileRef exists ifTrue: [ MaEnvironmentError signal: fileRef pathString , ' already exists.' ].
	file := fileRef writeStream.
	(file isNil or: [ file closed ]) ifTrue: [ MaEnvironmentError signal: 'Could not create ' , fileRef pathString ].
	^ self
		create: file binary
		keySize: numberOfBitsInteger
		valueSize: valueSize
		recordSize: entriesInteger