private
refreshFrom: anotherMagmaCollectionReaderSegment 
	"I prefer this to become:.."
	1 
		to: self class instSize
		do: 
			[ : n | 
			self 
				slotAt: n
				put: (anotherMagmaCollectionReaderSegment slotAt: n) ]