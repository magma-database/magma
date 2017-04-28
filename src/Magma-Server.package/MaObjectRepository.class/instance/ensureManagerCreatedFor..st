building
ensureManagerCreatedFor: aMagmaLargeCollection 
	^ largeCollectionManagers 
		at: (self session oidFor: aMagmaLargeCollection)
		ifAbsentPut: [ aMagmaLargeCollection newManagerUsing: self ]