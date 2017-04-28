*magma-server-MagmaArray-support
magmaArrayChangesAt: oidInteger 
	commitPackage allLargeCollectionChangesDo: 
		[ : each | 
		each collectionOid = oidInteger ifTrue: [ ^ each ] ].
	^ nil