private
getNextSegmentAndLoadIf: oneArgBlock
	"Generate the next segment and, if oneArgBlock valued with it answers true, load objects into it too."
	| toRefresh |
	toRefresh := segments 
		ifEmpty: 
			[ (MagmaCollectionReaderSegment new)
				startIndex: 1 ;
				trunkStart: 1 ;
				yourself ]
		ifNotEmpty: [ segments last nextSegment ].
	self 
		refreshSegment: toRefresh
		loadObjects: (oneArgBlock value: toRefresh).
	"Return nil unless a new segment was created."
	^ (segments isEmpty or: [ segments last ~= toRefresh ]) ifTrue: [ segments add: toRefresh ]
