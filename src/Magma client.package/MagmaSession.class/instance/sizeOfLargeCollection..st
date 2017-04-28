private
sizeOfLargeCollection: aMagmaCollection
	"Calls sizeOfLargeCollection:"
	self ensureConnected.  "Need this before we call oidFor:, below."
	^ self secondarySubmit:
		(MaLargeCollectionSizeRequest new 
			collectionOid: (self oidFor: aMagmaCollection) ;
			yourself)