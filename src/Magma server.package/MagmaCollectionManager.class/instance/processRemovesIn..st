private
processRemovesIn: aMaLargeCollectionChanges 
	aMaLargeCollectionChanges removedDo: 
		[ : eachOid : eachHashIndexValuesArray | 
		| didRemove |
		didRemove := memberIndex 
			remove: self dummyValue
			at: eachOid.
		didRemove ifTrue: 
			[ eachHashIndexValuesArray withIndexDo: 
				[ : eachArray : x | 
				eachArray do: 
					[ : eachKeyValue | 
					(oidIndexes at: x) 
						remove: eachOid
						at: eachKeyValue.
					(keyIndexes at: x) 
						remove: eachKeyValue
						at: eachOid ] ] ] ]