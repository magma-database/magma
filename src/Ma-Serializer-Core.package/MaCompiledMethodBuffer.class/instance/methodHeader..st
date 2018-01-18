access
methodHeader: anInteger 
	^ self
		longAt: self bufferPositionOfMethodHeader
		put: anInteger