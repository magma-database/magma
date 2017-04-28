removed indexes
removeIndexNamed: attributeSymbol 
	self removeIndexValuesFor: (collection indexNamed: attributeSymbol).
	self hasAddedIndexes 
		ifTrue: 
			[ self addedIndexes 
				maDetect: [ : each | each attribute = attributeSymbol ]
				ifFound: [ : foundIndex | self addedIndexes remove: foundIndex ]
				ifNone: [ self removedIndexes add: attributeSymbol ] ]
		ifFalse: [ self removedIndexes add: attributeSymbol ]