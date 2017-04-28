*magma-server-private
shouldInclude: oid using: aMagmaCollectionManager 
	"in the keys indexes, the oid is the key, the key is the value."
	self isAlwaysFalse ifTrue: [ ^ false ].
	(aMagmaCollectionManager keysIndexForAttribute: attribute) 
		entriesFrom: oid
		do: 
			[ : eachRecord : bax : level | 
			((eachRecord valueAtByteArrayIndex: bax) 
				between: lowKey
				and: highKey) ifTrue: 
				[ "key"
				^ true ] ]
		until: [ : eachRecord : bax : level | (eachRecord keyAtByteArrayIndex: bax) > oid ].
	^ false