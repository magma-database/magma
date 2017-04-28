private
asFilteredReader
	^ MagmaCollectionFilteredReader new
		collection: collection ;
		expression: expression ;
		yourself