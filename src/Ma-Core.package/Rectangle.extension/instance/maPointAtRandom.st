*ma-core
maPointAtRandom
	^(self topLeft x + (self width * Random new next)) @ (self topLeft y + (self height * Random new next))