testing
validateUsing: aMagmaCollectionReader 
	terms do: [ : each | each validateUsing: aMagmaCollectionReader ]