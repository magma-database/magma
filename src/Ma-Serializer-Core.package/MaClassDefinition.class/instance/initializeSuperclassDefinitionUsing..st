building
initializeSuperclassDefinitionUsing: aMaClassIdManager 
	| superclassDefinitions |
	superclassDefinitions := aMaClassIdManager classDefinitionsForClass: self classObject superclass.
	superclassDefinition := superclassDefinitions
		detect:
			[ : each | each notNil and: [ each hasSameDefinitionAs: self classObject superclass ] ]
		ifNone: [ aMaClassIdManager inImageDefinition: self classObject superclass ]