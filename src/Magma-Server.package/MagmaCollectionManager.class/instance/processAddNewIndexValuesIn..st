private
processAddNewIndexValuesIn: aMagmaCollectionChanges 
	"Serialize the new values for an index that is being built."
	aMagmaCollectionChanges hasNewIndexValues ifFalse: [ ^ self ].
	aMagmaCollectionChanges newIndexValues keysAndValuesDo: 
		[ : eachAttribute : eachValues | 
		| oidsIndex keysIndex |
		oidsIndex := self oidsIndexForAttribute: eachAttribute.
		keysIndex := self keysIndexForAttribute: eachAttribute.
		eachValues do: 
			[ : eachAssociation | 
			eachAssociation key do: 
				[ : eachKey | 
				oidsIndex 
					add: eachAssociation value
					at: eachKey.
				keysIndex
					add: eachKey
					at: eachAssociation value ] ] ]