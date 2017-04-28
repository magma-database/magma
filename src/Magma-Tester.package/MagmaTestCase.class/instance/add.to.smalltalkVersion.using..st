test keyword index
add: anAssociation to: aMagmaCollection smalltalkVersion: smalltalkIndex using: aMaKeywordIndexDefinition

	aMagmaCollection add: anAssociation.
	(aMaKeywordIndexDefinition indexObjectFor: anAssociation) do:
		[ : eachWord |
		| bag |
		bag := 
		smalltalkIndex
			at: eachWord
			ifAbsentPut: [ nil "we just need the entry-key, bag must be indexed at a different key" ].
		"We never add anAssociation twice to the MagmaCollection, therefore we must be sure not to add it twice to the Smalltalk collection."
		bag := 
			smalltalkIndex
				at: (aMaKeywordIndexDefinition indexHashForIndexObject: eachWord)
				ifAbsentPut: [ Bag new ].
		bag add: anAssociation ]