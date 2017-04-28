private-magma collections
upTo: anInteger objectsIn: aMagmaCollection fromIndex: startIndex using: aMaReadStrategy 
	"Answer a MaCollectionSegment or aMaIndexedCollectionSegment.  Calls upTo:oidsFromIndex:inLargeCollection:using:forSession: "
	^ guard critical: 
		[ | segmentResult |
		segmentResult := self secondarySubmit: (MaSegmentByIndexRequest new
				quantity: anInteger ;
				collectionOid: (self oidFor: aMagmaCollection) ;
				lowIndex: startIndex ;
				readStrategy: aMaReadStrategy ;
				yourself).
		self materializeObjectsIn: segmentResult.
		self inTransaction ifTrue: [ self stronglyReference: segmentResult ].
		segmentResult ]