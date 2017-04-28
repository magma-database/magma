*magma client
refresh: anObject using: aMagmaSession
	| inImageDefinition linkDescriptionDefinition classIdManager |
	anObject ifNil: [ ^ self ].  "WeakKeyDictionaries can have nil keys."
	classIdManager := aMagmaSession serializer classIdManager.
	inImageDefinition :=  classIdManager inImageDefinition: anObject maSerializationClass.
	linkDescriptionDefinition := classIdManager
		definitionForClassId: (classIdManager idForClass: anObject maSerializationClass)
		version: self classVersion.
	self instVarsDoWithIndex:
		[ : sourceOid : sourceIndex |  | targetIndex |
		targetIndex := 
			inImageDefinition
				indexOfInstVarCorrespondingTo: sourceIndex
				of: linkDescriptionDefinition.
		targetIndex > 0
			ifTrue:
				[ (anObject maIsTransient: targetIndex) ifFalse:
					[ anObject
						instVarAt: targetIndex
						put: (aMagmaSession serializer objectWithOid: sourceOid) ] ]
			ifFalse:
				[ sourceOid = MaOidCalculator oidForNil
					ifFalse:
						[ aMagmaSession serializer recordTruncatedObject: anObject ] ] ]