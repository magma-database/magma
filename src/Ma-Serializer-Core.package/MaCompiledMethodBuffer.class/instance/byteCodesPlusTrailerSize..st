access
byteCodesPlusTrailerSize: anInteger 
	self
		uint: 32
		at: self bufferPositionOfByteCodesPlusTrailerSize
		put: anInteger