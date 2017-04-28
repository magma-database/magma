private
mergeChangesUnsortedAdditions
	"I am not sorted.  My segment is populated with the desired segment, my segments are populated.  Put my collections changes at the beginning, fixing up my subsequent segments as necessary."
	collection changes additionsDo: 
		[ : eachObject : eachHashes | 
		(expression qualifyingHashesOf: eachObject) do: 
			[ : eachAttributeAndHash | 
			localAdditionsSegment ifNil: 
				[ segments addFirst: (localAdditionsSegment := MagmaCollectionReaderSegment new
						startIndex: 1 ;
						endIndex: 0 ;
						trunk: trunk ;
						yourself) ].
			localAdditionsSegment
				addObject: eachAttributeAndHash value -> eachObject ;
				advanceEnd: 1.
			self 
				segmentsAfter: localAdditionsSegment
				do: [ : each | each advanceStart: 1 ] ] ]