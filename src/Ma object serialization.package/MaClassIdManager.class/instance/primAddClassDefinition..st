private
primAddClassDefinition: aMaClassDefinition 
	"Add only aMaClassDefinition without any of its superclasses."
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
				[ definitions
					at: aMaClassDefinition version
					put: aMaClassDefinition ] ].
	answer isDefined ifTrue:
		[ self
			idOfClass: answer classObject
			is: answer id.
		self refreshInImageDefinition: answer classObject ].
	^ answer