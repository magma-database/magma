*magma server
process

	^ self repository
		numberOfEntriesFrom: lowKey
		to: highKey
		inLargeCollection: collectionOid
		on: attribute