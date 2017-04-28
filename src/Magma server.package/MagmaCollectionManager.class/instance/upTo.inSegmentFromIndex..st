private
upTo: anInteger inSegmentFromIndex: lowIndex

	| keysAndValues |
	keysAndValues :=  
		memberIndex
			upTo: anInteger
			keysAndValuesFromIndex: lowIndex.
	^ MagmaCollectionSegment new
		lastKnownSize: memberIndex size ;
		startIndex: lowIndex ;
		objects: keysAndValues first  "there are no 'values' in the member-index, the keys are the objects." ;
		yourself