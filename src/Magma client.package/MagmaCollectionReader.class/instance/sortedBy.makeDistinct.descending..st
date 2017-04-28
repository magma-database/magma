sort
sortedBy: attributeSymbol makeDistinct: aBoolean descending: shouldDescend 
	"If I am already sorted by attributeSymbol and can allow duplicates, answer myself immediately.  Otherwise, create a new a new MagmaCollection with a single-index on attributeSymbol, containing only the objects in me.  Answer it immediately only after the sort has completed."
	| answer |
	answer := self 
		sortBy: attributeSymbol
		makeDistinct: aBoolean
		descending: shouldDescend.
	[ answer sortComplete ] whileFalse: [ (Delay forMilliseconds: 400) wait ].
	^ answer