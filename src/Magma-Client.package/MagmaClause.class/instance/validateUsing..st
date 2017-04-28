testing
validateUsing: aMagmaCollectionReader 
	(aMagmaCollectionReader collection hasIndexNamed: attribute) ifFalse: 
		[ MagmaUserError signal: attribute , ' is not an indexed attribute of this collection.' ]