*magma client
commitNumber: anInteger 
	^ self 
		uint: 48
		at: self bufferPositionOfCommitNumber
		put: anInteger