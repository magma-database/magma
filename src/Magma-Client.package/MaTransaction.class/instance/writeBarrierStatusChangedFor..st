initializing
writeBarrierStatusChangedFor: aMagmaSession 
	"Enumerate all persistent objects and put them appropriately either into my writeBarrier or readSet."
	aMagmaSession serializer objectsDo:
		[ : each | | buffer |
		buffer := aMagmaSession bufferFor: each.
		self
			 remove: each ;
			
			markRead: each
			using: buffer ]