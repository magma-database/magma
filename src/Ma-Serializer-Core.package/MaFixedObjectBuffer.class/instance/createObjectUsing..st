creation
createObjectUsing: aMaObjectSerializer 
	| class indexedSize sourceDefinition |
	class := self ensureClassUsing: aMaObjectSerializer.
	sourceDefinition := aMaObjectSerializer classIdManager
		definitionForClassId: self classId
		version: self classVersion.
	indexedSize := self objectInstSize - sourceDefinition namedInstSize.
	^ indexedSize = 0
		ifTrue: [ class basicNew ]
		ifFalse: [ class basicNew: indexedSize ]