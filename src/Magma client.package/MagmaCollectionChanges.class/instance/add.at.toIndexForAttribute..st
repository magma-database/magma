added indexes
add: oid at: indexHashValues toIndexForAttribute: aSymbol 
	(self newIndexValues 
		at: aSymbol
		ifAbsentPut: [ OrderedCollection new ]) add: 
			(Association 
				key: indexHashValues
				value: oid)