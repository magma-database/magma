*ma-core
maPointAtRandom
	^(self topLeft x + (self width * ThreadSafeRandom default next)) @ (self topLeft y + (self height * ThreadSafeRandom default next))