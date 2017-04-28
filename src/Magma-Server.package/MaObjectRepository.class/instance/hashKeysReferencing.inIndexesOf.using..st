magma-collections
hashKeysReferencing: eachOid inIndexesOf: sourceManager using: aMagmaCollectionManager 
	| hashesByIndex |
	hashesByIndex := OrderedCollection new.
	"Normally there will be just one index at this time (building a sort result), but be generic anyway.."
	aMagmaCollectionManager collection descriptionsDo:  
		[ : each | 
		| eachKeysHdx eachHashes |
		eachHashes := OrderedCollection new.
		eachKeysHdx := sourceManager keysIndexForAttribute: each attribute.
		eachKeysHdx 
			keysAndValuesFrom: eachOid
			startingAt: 1
			do: [ : eachOidAgain : eachKeyLocation | eachHashes add: eachKeyLocation ]
			until: [ : eachOidAgain : eachKeyLocation | eachOidAgain > eachOid ].
		hashesByIndex add: eachHashes ].
	^ hashesByIndex