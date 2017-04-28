accessing
physicalSize
	^ byteArray
		maUint: 32 "[self class sizeOfPhysicalSizeField * 8] once"
		at: self bufferPositionOfPhysicalSize