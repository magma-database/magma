*magma-server
maWrite: numberOfBytes bytesFromPosition: bufferPosition of: byteArray atFilePosition: filePosition

	self position: filePosition.
	self
		next: numberOfBytes
		putAll: byteArray
		startingAt: bufferPosition