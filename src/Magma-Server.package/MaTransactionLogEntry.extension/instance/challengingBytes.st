*magma-server
challengingBytes
	^ challengingEntries
		inject: 0
		into: [ : sum : each | sum + each bytesConsumed ]