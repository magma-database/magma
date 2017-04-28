building
addClassDefinition: aMaClassDefinition 
	| definitions answer |
	definitions := self ensureClassDefinitionsFor: aMaClassDefinition.
	(answer := self
		definitionLike: aMaClassDefinition
		in: definitions) ifNil:
		[ answer := aMaClassDefinition.
		aMaClassDefinition version = 0
			ifTrue:
				[ definitions add: aMaClassDefinition.
				aMaClassDefinition version: definitions size ]
			ifFalse:
				[ [ definitions size < aMaClassDefinition version ] whileTrue: [ definitions add: nil ].
				definitions
					at: aMaClassDefinition version
					put: aMaClassDefinition ] ].
	answer isDefined ifTrue:
		[ self
			idOfClass: answer classObject
			is: answer id.
		self refreshInImageDefinition: answer classObject.
		(answer superclassDefinition isNil and: [ answer classObject superclass ~= nil ]) ifTrue:
			[ self addNewClass: answer classObject superclass.
			answer initializeSuperclassDefinitionUsing: self ] ].
	^ answer