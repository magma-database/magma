overriding
upTo: anInteger inSegmentFromIndex: lowIndex

	| oids |
	oids := 
		memberIndex
			upTo: anInteger
			startingAt: lowIndex.
	^ MagmaCollectionSegment new
		lastKnownSize: memberIndex size ;
		startIndex: lowIndex ;
		objects: oids ;
		yourself