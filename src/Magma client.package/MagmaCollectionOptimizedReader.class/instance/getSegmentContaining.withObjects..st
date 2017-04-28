private
getSegmentContaining: anInteger withObjects: aBoolean 
	| answer numberOfUncommitted pageStartIndex expandedPageSize |
	numberOfUncommitted := self numberOfUncommittedInRange.
	pageStartIndex := self isDescending 
		ifTrue: 
			[ "we're reversed, so as they populate their list and send at: 1, at: 2, at: 3, etc., it will cause a page-load every time, killing performance.  So invert the page-direction to backward rather than forward."
			anInteger - (numberOfUncommitted max: pageSize - 1) max: 1 ]
		ifFalse: [ anInteger - numberOfUncommitted max: 1 ].
	"But we must also account for expanding the page in both directions of indexInteger by the numberOfUncommitted, so we can properly integrate the non-committeds."
	expandedPageSize := self pageSize max: 2 * numberOfUncommitted.
	answer := MagmaCollectionReaderSegment new
		startIndex: pageStartIndex ;
		trunkStart: pageStartIndex ;
		yourself.
	self 
		refreshSegment: answer
		loadObjects: aBoolean
		pageSize: expandedPageSize.
	^ (answer lastKnownSize = 0 or: [ answer includesIndex: pageStartIndex ]) ifTrue: [ answer ]