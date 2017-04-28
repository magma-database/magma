private-magma collections
refreshSegment: aMagmaCollectionReaderSegment of: aMagmaCollection where: aMaTerm pageSize: anInteger using: aMaReadStrategy loadObjects: aBoolean 
	"Calls refreshSegmentIn:"
	guard critical: 
		[ | segment |
		segment := self secondarySubmit: (MaRefreshSegmentRequest new
				quantity: anInteger ;
				collectionOid: (self oidFor: aMagmaCollection) ;
				segment: aMagmaCollectionReaderSegment ;
				expression: aMaTerm ;
				readStrategy: aMaReadStrategy ;
				loadObjects: aBoolean ;
				exceptions: aMagmaCollection changes removedOids ;
				yourself).
		"Since we say we 'refresh' let's do that instead of returning the new one."
		aMagmaCollectionReaderSegment refreshFrom: segment.
		self materializeObjectsIn: aMagmaCollectionReaderSegment ]