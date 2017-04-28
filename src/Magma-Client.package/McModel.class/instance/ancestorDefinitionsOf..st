private
ancestorDefinitionsOf: aMCVersion 
	"Obtain the definitions of the immediate ancestors of aMCVersion and put them into a Dictionary.  This is used to improve the performance of canonicalizedDefinitionsFor:."
	| defs |
	defs := Dictionary new.
	aMCVersion info ancestors do:
		[ : eachAncestor | (self versionWithInfo: eachAncestor) ifNotNil:
			[ : eachAncestorVersion | eachAncestorVersion definitions do:
				[ : eachMcDefinition | defs
					at: eachMcDefinition
					put: eachMcDefinition ] ] ].
	^ defs