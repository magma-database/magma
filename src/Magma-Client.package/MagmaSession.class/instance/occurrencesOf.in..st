private-magma collections
occurrencesOf: anObject in: aMagmaCollection 
	"Calls numberOfEntriesFrom:to:inLargeCollection:on:."
	| oid |
	^ self secondarySubmit: 
		(MaKeyIntervalInfoRequest new
			collectionOid: (self oidFor: aMagmaCollection) ;
			attribute: nil ;
			lowKey: (oid := self oidFor: anObject) ;
			highKey: oid ;
			yourself)