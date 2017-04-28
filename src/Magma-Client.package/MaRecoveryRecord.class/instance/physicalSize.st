accessing
physicalSize
	^ byteArray
"		maUint: 32" "[self class sizeOfPhysicalSizeField * 8] once"
		maUnsigned32At: self bufferPositionOfPhysicalSize +1