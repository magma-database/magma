indexing
removeIndexNamed: attributeSymbol 
	self lock.
	changes removeIndexNamed: attributeSymbol.
	indexes remove: (indexes detect: [ : each | each attribute = attributeSymbol ]).
	descriptions remove: (descriptions detect: [ : each | each attribute = attributeSymbol ])