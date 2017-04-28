*magma-client
refreshFrom: aMaObjectBuffer using: aMagmaSession includingLocal: aBoolean 
	| inImageDefinition linkDescriptionDefinition classIdManager |
	classIdManager := aMagmaSession serializer classIdManager.
	inImageDefinition := classIdManager inImageDefinition: self maSerializationClass.
	linkDescriptionDefinition := classIdManager
		definitionForClassId: (classIdManager idForClass: self maSerializationClass)
		version: aMaObjectBuffer classVersion.
	aMaObjectBuffer instVarsDoWithIndex:
		[ : sourceOid : sourceIndex |  | targetIndex |
		targetIndex := 
			inImageDefinition
				indexOfInstVarCorrespondingTo: sourceIndex
				of: linkDescriptionDefinition.
		targetIndex > 0
			ifTrue:
				[ (self maIsTransient: targetIndex) ifFalse:
					[ self
						slotAt: targetIndex
						put: (aMagmaSession serializer objectWithOid: sourceOid) ] ] ]