*ma base additions
maPointAtRandom
	^(self topLeft x + (self width * Collection randomForPicking next)) @ (self topLeft y + (self height * Collection randomForPicking next))