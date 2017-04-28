private
processChangedIndexValuesIn: aMaCollectionChanges 
	aMaCollectionChanges changedKeySpecificationsDo: 
		[ : eachChangedKeySpecification | 
		| oidsIndex keysIndex |
		oidsIndex := self oidsIndexForAttribute: eachChangedKeySpecification attribute.
		keysIndex := self keysIndexForAttribute: eachChangedKeySpecification attribute.
		(memberIndex includesKey: eachChangedKeySpecification object) ifTrue: 
			[ eachChangedKeySpecification oldHashValues do: 
				[ : eachChangedKeySpecificationHashKeyValue | 
				oidsIndex 
					remove: eachChangedKeySpecification oid
					at: eachChangedKeySpecificationHashKeyValue.
				keysIndex
					remove: eachChangedKeySpecificationHashKeyValue 
					at: eachChangedKeySpecification oid ].
			eachChangedKeySpecification newHashValues do: 
				[ : eachChangedKeySpecificationHashKeyValue | 
				oidsIndex 
					add: eachChangedKeySpecification oid
					at: eachChangedKeySpecificationHashKeyValue.
				keysIndex
					add: eachChangedKeySpecificationHashKeyValue 
					at: eachChangedKeySpecification oid ] ] ]