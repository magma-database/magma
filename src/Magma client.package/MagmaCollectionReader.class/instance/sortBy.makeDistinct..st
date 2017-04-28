sort
sortBy: attributeSymbol makeDistinct: aBoolean 
	"If I am already sorted by attributeSymbol and can allow duplicates, answer myself immediately.  Otherwise, create a new a new MagmaCollection with a single-index on attributeSymbol, containing only the objects in me.  Answer it immediately, but it is being sorted in the background."
	^ self 
		sortBy: attributeSymbol
		makeDistinct: aBoolean
		descending: false