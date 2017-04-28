accessing
maInstVarAt: anInteger 
	^ self 
		uint: 8
		at: (self bufferPositionOfInstVarAt: anInteger)