private
refreshFrom: anotherMagmaCollectionReaderSegment 
	"I prefer this to become:.."
	1 
		to: self class instSize
		do: 
			[ : n | 
			self 
				instVarAt: n
				put: (anotherMagmaCollectionReaderSegment instVarAt: n) ]