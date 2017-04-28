access
bufferPrintString
	^ buffer isBytes 
		ifTrue: [ buffer asString ]
		ifFalse: [ 'a ' , self objectClassName ]