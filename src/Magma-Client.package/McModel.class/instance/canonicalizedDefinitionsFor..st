private
canonicalizedDefinitionsFor: aMCVersion 
	"Find or create a canonicalized definitions for aMCVersion."
	| canonicalizedDefs ancestorDefs |
	canonicalizedDefs := OrderedCollection new: aMCVersion definitions size.
	ancestorDefs := self ancestorDefinitionsOf: aMCVersion.
	aMCVersion definitions do:
		[ : each | canonicalizedDefs add:
			(ancestorDefs
				at: each
				ifAbsent:
					[ self
						canonicalizedDefinition: each
						of: aMCVersion ]) ].
	^ canonicalizedDefs