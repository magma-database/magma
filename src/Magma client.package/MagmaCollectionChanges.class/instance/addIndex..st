added indexes
addIndex: aMagmaIndexDescription 
	self addedIndexes add: aMagmaIndexDescription.
	self appendIndexValuesFor: (collection indexNamed: aMagmaIndexDescription attribute)