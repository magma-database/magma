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
			aMaClassReference isDefinition ifTrue:
				[ (defs noneSatisfy:
					[ : each | each isKnownAs: aMaClassReference name ]) ifTrue: [ MaObjectSerializationUserError signal: 'MaClassDefinitions are private to serializers, you must not serialize MaClassDefinitions from other serializers.' ] ].
			aMaClassReference id: id ] ;
		
		afterMaterializingAny: #MaClassDefinition
		do:
			(MessageSend
				receiver: classIdManager
				selector: #addClassDefinition:)