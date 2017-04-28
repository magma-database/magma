private
mergeChangesSorted
	"I am sorted.  My segment may be populated with the desired segment, my segments are populated.  Merge in my collections changes, fixing up my segments as necessary."
	| sortNeeded sortIndex |
	sortNeeded := false.
	sortIndex := self sortIndex.
	collection changes additionsDo: 
		[ : eachObject : eachHashes | 
		(expression qualifyingHashesOf: eachObject) do: 
			[ : eachAttributeAndHash | 
			eachAttributeAndHash key = sortIndex attribute ifTrue: 
				[ sortNeeded := sortNeeded | (self 
						mergeAddition: eachObject
						at: eachAttributeAndHash value) ] ] ].
	sortNeeded ifTrue: [ segment sortObjects: expression ascendingSortBlock ]