*ma-core
maPointAtRandom
	^(self topLeft x + (self width * SharedRandom globalGenerator next)) @ (self topLeft y + (self height * SharedRandom globalGenerator next))