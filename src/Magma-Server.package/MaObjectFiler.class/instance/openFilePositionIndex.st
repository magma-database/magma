private
openFilePositionIndex
	filePositionIndex := 
	[ MaLargeArrayOfNumbers open: (MaAtomicFileStream fileNamed: self filePositionIndexFileName) ] ifCurtailed: [ self close ]