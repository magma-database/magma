magma-collections
collectionManagerFor: oidInteger ifAbsent: aBlock 
	^ largeCollectionManagers 
		at: oidInteger
		ifAbsent: 
			[ | mc |
			mc := self session 
				objectWithOid: oidInteger
				ifAbsent: [ ^ aBlock value ].
			self openLargeCollectionIfNecessary: mc ]