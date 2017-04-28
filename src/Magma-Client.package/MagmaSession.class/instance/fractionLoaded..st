private-magma collections
fractionLoaded: aMagmaCollection 
	"Calls loadProgress."
	^ self submit: (
		(MaLoadProgressRequest new)
			collectionOid: (self oidFor: aMagmaCollection) ;
			yourself)