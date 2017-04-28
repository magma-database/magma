private
physicalSize: anInteger 
	byteArray
		maUint: 32 "self class sizeOfPhysicalSizeField*4"
		at: self bufferPositionOfPhysicalSize
		put: anInteger