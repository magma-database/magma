file-specific
writeHeaderFrom: aByteArray

	file
		maWrite: self headerSize
		bytesFromPosition: 1
		of: aByteArray
		atFilePosition: 0