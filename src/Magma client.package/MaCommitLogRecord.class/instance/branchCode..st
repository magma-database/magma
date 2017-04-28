accessing
branchCode: anInteger 
	byteArray 
		maUint: 32
		at: self bufferPositionOfBranchCode
		put: anInteger