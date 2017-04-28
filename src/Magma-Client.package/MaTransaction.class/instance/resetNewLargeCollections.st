private
resetNewLargeCollections
	largeCollectionChanges := largeCollectionChanges reject:
		[ : each | (MaOidCalculator isOidForNewObject: each collectionOid) and:
			[ each collectionOid: nil.
			true ] ]