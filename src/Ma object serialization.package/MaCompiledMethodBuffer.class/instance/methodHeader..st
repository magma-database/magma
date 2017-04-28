access
methodHeader: anInteger 
	^ self
		uint: 32
		at: self bufferPositionOfMethodHeader
		put: anInteger