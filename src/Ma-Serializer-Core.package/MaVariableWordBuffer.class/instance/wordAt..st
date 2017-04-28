accessing
wordAt: logicalPosition

	^ self 
		uint: 32
		at: (self bufferPositionOfInstVarAt: logicalPosition)