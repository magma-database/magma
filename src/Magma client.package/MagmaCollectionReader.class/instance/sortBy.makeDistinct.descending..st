sort
sortBy: attributeSymbol makeDistinct: aBoolean descending: shouldDescend 
	"If I am already sorted by attributeSymbol and can allow duplicates, answer myself immediately.  Otherwise, create a new a new MagmaCollection with a single-index on attributeSymbol, containing only the objects in me.  Answer it immediately, but it is being sorted in the background."
	^ (aBoolean not and: [ self isSorted and: [ self sortIndex attribute = attributeSymbol ] ]) 
		ifTrue: [ self ]
		ifFalse: 
			[ (self 
				newReducedReaderOn: attributeSymbol
				makeDistinct: aBoolean)
				descending: shouldDescend ;
				yourself ]