initialize
initializeFromHeader: aByteArray 
	broker recordSize:
		(aByteArray 
			maUint: 8
			at: 0)