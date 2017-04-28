private-magma collections
monitorLargeCollection: aMagmaCollection 
	(aMagmaCollection session notNil and: [ aMagmaCollection session ~= self ]) ifTrue: 
		[ MagmaUserError signal: 'LargeCollections cannot be shared with other repositories.' ].
	aMagmaCollection setOid: (self oidFor: aMagmaCollection).
	transaction monitorLargeCollectionChanges: aMagmaCollection changes