accessing
wordAt: logicalPosition put: anInteger

	self
		uint: 32
		at: (self bufferPositionOfInstVarAt: logicalPosition)
		put: anInteger