private
refreshSegment: aMagmaCollectionReaderSegment where: aMaTerm 
	aMagmaCollectionReaderSegment initializeObjects.
	self additionsDo: 
		[ : eachObject : eachHashes | 
		"To be consistent with persistent readers, for each condition which satisfies the expression, the object is included."
		(aMaTerm qualifyingHashesOf: eachObject) do: 
			[ : eachAttributeAndHash | 
			aMagmaCollectionReaderSegment addObject: eachAttributeAndHash value -> eachObject ] ].
	aMagmaCollectionReaderSegment
		startIndex: 1 ;
		endIndex: aMagmaCollectionReaderSegment objects size ;
		lastKnownSize: aMagmaCollectionReaderSegment objects size