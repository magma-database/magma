private
markClassReferenced: aMaObjectBuffer 
	| classIdManager |
	classIdManager := inputController session serializer classIdManager.
	(classIdManager 
		definitionForClassId: aMaObjectBuffer classId
		version: aMaObjectBuffer classVersion) 
		withAllSuperclassDefinitionsDo: 
			[ : eachClassDefinition | 
			referencedClasses add: eachClassDefinition id ].
	"If a class-reference, be sure to get the referenced class itself."
	(aMaObjectBuffer classId = (classIdManager idForClass: MaClassReference))
		ifTrue:
			[ | indexOfId classReferenceDefinition |
			classReferenceDefinition :=
				classIdManager
					definitionForClassId: aMaObjectBuffer classId
					version: aMaObjectBuffer classVersion.
			"Get the index of the 'id' variable."
			indexOfId := classReferenceDefinition allInstVarNames indexOf: 'id'.
			indexOfId = 0 ifTrue: [ MagmaSoftwareError signal: 'Expected ''id'' variable.' ].
			(classIdManager 
				definitionForClassId:
					(inputController session
						objectWithOid: (aMaObjectBuffer maInstVarAt: indexOfId)
						ifAbsent: [ MagmaSoftwareError signal: 'Expected an to find an id' ])
				version: 1) 

				withAllSuperclassDefinitionsDo: 
					[ : eachClassDefinition | 
					referencedClasses add: eachClassDefinition id ] ]