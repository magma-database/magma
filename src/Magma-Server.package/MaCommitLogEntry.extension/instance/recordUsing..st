*magma-server
recordUsing: aMaObjectRepository 
	"Record my successful commit in the places that need to know."
	commitPackage objectsDo:
		[ : eachBuffer | (result newObjectBuffers includesKey: eachBuffer oid) ifFalse:
			[ committed
				at: eachBuffer oid
				put: eachBuffer copyWithSameBuffer ].
		self
			refreshIfCountersOrStat: eachBuffer
			using: aMaObjectRepository ].
	result changedObjectBuffers: committed