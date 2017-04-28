private
segmentFromIndex: startIndex pageSize: anInteger
	"Answer a MaCollectionSegment."

	^ self
		segmentFromIndex: startIndex
		pageSize: anInteger
		using: (session ifNotNil: [session resetReadStrategy])