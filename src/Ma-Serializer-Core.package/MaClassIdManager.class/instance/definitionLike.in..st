testing
definitionLike: aMaClassDefinition in: definitionsCollection 
	definitionsCollection isEmpty ifTrue: [ ^ nil ].
	(definitionsCollection anySatisfy:
		[ : each | each className = aMaClassDefinition className ]) ifFalse: [ ^ nil ].
	(definitionsCollection includes: aMaClassDefinition) ifTrue: [ ^ aMaClassDefinition ].
	^ definitionsCollection
		detect:
			[ : eachDef | eachDef notNil and: [ eachDef hasSameDefinitionAs: aMaClassDefinition ] ]
		ifNone: [ nil ]