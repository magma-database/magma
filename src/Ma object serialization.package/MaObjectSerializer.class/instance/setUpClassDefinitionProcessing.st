initializing
setUpClassDefinitionProcessing
	preferences
		
		beforeSerializingAny: #MaClassReference
		do:
			[ : aMaClassReference | | id defs |
			id := classIdManager
				idForClass: aMaClassReference classObject
				ifAbsent: [ (classIdManager addNewClass: aMaClassReference classObject theNonMetaClass) id ].
			defs := classIdManager
				classDefinitionsForId: id
				ifAbsent: [ Array empty ].
			(defs noneSatisfy:
				[ : each | each notNil and: [each isKnownAs: aMaClassReference name] ]) ifTrue: [ MagmaUserError signal: 'MaClassDefinitions are private to serializers, you must not includes MaClassDefinitions from other serializers in this model.' ].
			aMaClassReference id: id ] ;
		
		afterMaterializingAny: #MaClassDefinition
		do:
			(MessageSend
				receiver: classIdManager
				selector: #addClassDefinition:)