indexing
hasIndexNamed: attributeSymbol

	^ indexes anySatisfy: [ : each | each attribute = attributeSymbol ]