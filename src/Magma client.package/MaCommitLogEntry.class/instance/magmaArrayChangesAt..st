magmaArray support
magmaArrayChangesAt: oidInteger 
	commitPackage allLargeCollectionChangesDo: 
		[ : each | 
		each collectionOid = oidInteger ifTrue: [ ^ each ] ].
	^ nil