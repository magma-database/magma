filestream api
maWrite: numberOfBytes bytesFromPosition: bufferPosition of: byteArray atFilePosition: filePosition 
	| writer |
	writer := MaAtomicFileWriter 
		file: self
		filePos: filePosition
		byteArray: (byteArray 
				copyFrom: bufferPosition
				to: bufferPosition + numberOfBytes - 1).
	guard critical: 
		[ writers 
			at: writer endFilePos
			put: writer.
		uncommittedSize := uncommittedSize max: filePosition + numberOfBytes.
		position := filePosition + numberOfBytes ]