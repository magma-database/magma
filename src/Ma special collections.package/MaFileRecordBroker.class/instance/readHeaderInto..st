file-specific
readHeaderInto: aByteArray

	file
		maRead: self headerSize
		bytesFromPosition: 1
		of: aByteArray
		atFilePosition: 0