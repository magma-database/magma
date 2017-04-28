*magma-server
bytesConsumed
	^ super bytesConsumed +
		(commitPackage
			ifNil: [ 0 ]
			ifNotNil: [ commitPackage bytesConsumed ])