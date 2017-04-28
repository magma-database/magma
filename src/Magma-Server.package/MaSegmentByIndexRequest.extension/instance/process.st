*magma-server
process

	^ self repository
		upTo: quantity
		oidsFromIndex: lowIndex
		inLargeCollection: collectionOid
		using: readStrategy
		forSession: sessionId