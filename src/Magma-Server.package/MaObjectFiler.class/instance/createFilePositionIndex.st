private
createFilePositionIndex
	filePositionIndex := MaLargeArrayOfNumbers 
		create: (MaAtomicFileStream fileNamed: self filePositionIndexFileName)
		bitSize: self class maxDbSize