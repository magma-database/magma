access
physicalSize: anInteger 
	self
		uint: self class sizeOfPhysicalSizeField
		at: self class bufferPositionOfPhysicalSize
		put: anInteger