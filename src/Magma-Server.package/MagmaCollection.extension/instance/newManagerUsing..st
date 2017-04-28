*magma-server
newManagerUsing: aMaObjectRepository

	^ (MagmaCollectionManager
		collection: self
		repository: aMaObjectRepository)
			oidOfIndexesCollection: (aMaObjectRepository session oidFor: self indexes) ;
			yourself