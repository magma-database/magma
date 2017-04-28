initialize-release
ensureIndex: aMaIndexDefinition at: indexPosition 
	oidIndexes size < indexPosition ifTrue: [ self addNewIndex: aMaIndexDefinition ]