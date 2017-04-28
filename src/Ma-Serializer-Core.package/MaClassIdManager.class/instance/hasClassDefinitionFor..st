testing
hasClassDefinitionFor: aClass 
	| foundQuickly |
	foundQuickly := inImageDefinitions
		at: aClass
		ifPresent: [ : definition | definition isPartOfClassDefinitions ]
		ifAbsent: [ false ].
	^ foundQuickly or:
		[ classDefinitionsById anySatisfy:
			[ : eachDefinitions | (eachDefinitions last isKnownAs: aClass name) and:
				[ eachDefinitions anySatisfy:
					[ : each | each notNil and: [ each hasSameDefinitionAs: aClass ] ] ] ] ]