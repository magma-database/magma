building
recordPotentialKeyChangesFrom: oldHashValues of: anObject index: aMaIndexDefinition in: aMagmaCollectionChanges 
	| newHashValues |
	anObject ifNil: [ ^ self ].
	newHashValues := aMaIndexDefinition indexHashesFor: anObject.
	"If hash index value has changed."
	(oldHashValues maConsistsOf: newHashValues) ifFalse: 
		[ | common |
		common := oldHashValues intersection: newHashValues.
		aMagmaCollectionChanges 
			move: anObject
			from: (oldHashValues copyWithoutAll: common)
			to: (newHashValues copyWithoutAll: common)
			forIndexedAttribute: aMaIndexDefinition attribute ]