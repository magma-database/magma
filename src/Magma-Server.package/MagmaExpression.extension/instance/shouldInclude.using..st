*magma-server-private
shouldInclude: oid using: aMagmaCollectionManager 
	^ self isConjunction 
		ifTrue: 
			[ self terms allSatisfy: 
				[ : each | 
				each 
					shouldInclude: oid
					using: aMagmaCollectionManager ] ]
		ifFalse: 
			[ self terms anySatisfy: 
				[ : each | 
				each 
					shouldInclude: oid
					using: aMagmaCollectionManager ] ]