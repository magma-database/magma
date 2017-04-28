private-magma collections
getTrunkFor: aMagmaCollection expression: aMaTerm 
	"Calls getTrunkFor:expression:."
	^ self secondarySubmit: 
		(MaReaderTrunkRequest new
			collectionOid: (self oidFor: aMagmaCollection) ;
			expression: aMaTerm ;
			yourself)