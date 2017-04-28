test MagmaSet
createAndPopulateMagmaSet
	| newSet |
	clientSession commit: 
		[ clientSession root 
			at: 'testMagmaSet'
			put: (
				MagmaSet new
					addIndex: (MaSearchStringIndex attribute: #key) beAscii ;
					equivalenceAttributes: #(key) ;
					yourself) ].
	newSet := clientSession root at: 'testMagmaSet'.
	self
		should: [ newSet isEmpty ] ;
		shouldnt: [ newSet includes: 3 -> 4 ].
	self 
		should: [ newSet add: Object new ]
		raise: MagmaUserError.
	self 
		should: [ newSet remove: 3 -> 4 ]
		raise: MagmaEquivalentObjectNotInCollection.
	self magmaSetEntries do: [ : eachAssociation | clientSession commit: [ newSet add: eachAssociation ] ]