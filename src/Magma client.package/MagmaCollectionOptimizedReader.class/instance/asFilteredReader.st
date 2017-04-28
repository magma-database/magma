private
asFilteredReader
	^ MagmaCollectionFilteredReader new
		collection: collection ;
		expression: self expression ;
		yourself