access
physicalSize
	^ self 
		uint: self class sizeOfPhysicalSizeField 
		at: self class bufferPositionOfPhysicalSize