private
canonicalizedDefinitionsFor: aMCVersion 
	"Find or create a canonicalized MCPackage for aMCVersion.  Also "
	| canonicalizedDefs |
	canonicalizedDefs := OrderedCollection new: aMCVersion definitions size.
	aMCVersion definitions
		do:
			[ : each | | existing |
			existing := canonicalizedDefs add:
				(objects
					at: {#definition. each}
					ifAbsent:
						[ "Cannot use elegance of nested #at:ifAbsentPut:'s because SOLHashTable cannot handle that."
						existing := (objects
							at: each description
							ifAbsentPut: [ OrderedCollection new ]) add: each.
						objects
							at: {#definition. each}
							put: existing ]).
			self
				checkAndRecordOriginOf: existing
				for: aMCVersion ]
		displayingProgress: 'Canonicalizing Definitions...'.
	^ canonicalizedDefs