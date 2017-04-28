sort
sortBy: attributeSymbol 
	"Determine if I am already sorted by attributeSymbol and, if so, answer self immediately.  Otherwise, create a new a new MagmaCollection with a single-index on attributeSymbol, containing only the objects in me."
	^ self 
		sortBy: attributeSymbol
		makeDistinct: false