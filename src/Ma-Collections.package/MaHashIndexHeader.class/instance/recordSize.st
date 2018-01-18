accessing
recordSize
	^ byteArray byteAt: (self positionOfRecordSizeForVersion: self version) + 1