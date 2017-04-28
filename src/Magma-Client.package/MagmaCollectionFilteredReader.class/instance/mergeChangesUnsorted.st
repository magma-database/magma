private
mergeChangesUnsorted
	"I am not sorted.  My segment is populated with the desired segment, my segments are populated.  Put my collections changes at the beginning, fixing up my subsequent segments as necessary."
	localAdditionsSegment ifNil: [ self mergeChangesUnsortedAdditions ]