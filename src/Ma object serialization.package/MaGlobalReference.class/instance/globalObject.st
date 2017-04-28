accessing
globalObject
	(Smalltalk hasClassNamed: self globalName) ifFalse: [ MaObjectSerializationSoftwareError signal: self globalName , ' not defined in this image.' ].
	^ Smalltalk classNamed: self globalName