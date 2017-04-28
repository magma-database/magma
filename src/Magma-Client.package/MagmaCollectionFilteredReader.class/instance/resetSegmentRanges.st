private
resetSegmentRanges
	"Before each merge of local changes, my segments must be reset to indicate the page index ranges as they exist in the repository, otherwise, multiple page retrieves would continue to modify the index ranges when changes were merged (incorrectly).  My lastKnownSize must also be reset."
	| totalMerged |
	totalMerged := 0.
	segments withIndexDo: 
		[ : each : index | 
		each = segments last ifTrue: [ totalMerged := each mergedCount ].
		each
			startIndex: (index - 1) * pageSize + 1 ;
			endIndex: each startIndex + pageSize - 1 ;
			resetMergedCount ].
	self adjustLastKnownSize: totalMerged