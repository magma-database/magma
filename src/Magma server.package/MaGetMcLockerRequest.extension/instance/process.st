*magma server
process
	^ (self repository 
		collectionManagerFor: mcOid
		ifAbsent: 
			[ MagmaEnvironmentError signal: 'Error, no largeCollectoinManager for that collection found.' ]) lockedBy