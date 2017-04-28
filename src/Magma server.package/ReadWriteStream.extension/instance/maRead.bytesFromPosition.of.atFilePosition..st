*magma server
maRead: someNumber bytesFromPosition: bufferPosition of: aByteArray atFilePosition: filePosition

	^ self
		position: filePosition ;
		readInto: aByteArray
		startingAt: bufferPosition
		count: someNumber