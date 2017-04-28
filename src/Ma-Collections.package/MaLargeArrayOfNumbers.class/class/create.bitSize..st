utilities
create: aReadWriteStream bitSize: anInteger

	^ (self newWithBitSize: anInteger)
		create: aReadWriteStream ;
		yourself