creation
establishReferencesFrom: anObject using: aMaObjectSerializer 
	| class sourceDefinition inImageDefinition |
	class := self ensureClassUsing: aMaObjectSerializer.
	sourceDefinition := aMaObjectSerializer classIdManager
		definitionForClassId: self classId
		version: self classVersion.
	inImageDefinition := aMaObjectSerializer classIdManager inImageDefinition: class.
	self instVarsDoWithIndex:
		[ : eachOid : sourceIndex | | targetIndex |
		targetIndex := inImageDefinition
			indexOfInstVarCorrespondingTo: sourceIndex
			of: sourceDefinition.
		targetIndex > 0
			ifTrue:
				[ anObject
					instVarAt: targetIndex
					put: (aMaObjectSerializer objectWithOid: eachOid) ]
			ifFalse:
				[ eachOid = MaOidCalculator oidForNil ifFalse: [ aMaObjectSerializer recordTruncatedObject: anObject ] ] ]