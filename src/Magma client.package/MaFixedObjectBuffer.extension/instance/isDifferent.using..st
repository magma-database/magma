*magma client
isDifferent: anObject using: aMaObjectSerializer
	"Only report anObject different if any of its *recorded* instVars changed, or if any of its *new* instVars is not nil."
	| classIdManager inImageDefinition bufferDefinition |
	classIdManager := aMaObjectSerializer classIdManager.
	inImageDefinition := classIdManager inImageDefinition: anObject maSerializationClass.
	bufferDefinition := 
		classIdManager
			definitionForClassId: self classId
			version: self classVersion.
	bufferDefinition id = inImageDefinition id ifFalse: [ ^ true ].
	1 to: anObject maInstSize do:
		[ : index |  | instVarIndexInBackup |
		(anObject maIsTransient: index) ifFalse:
			[ instVarIndexInBackup := bufferDefinition
				indexOfInstVarCorrespondingTo: index
				of: inImageDefinition.
			(instVarIndexInBackup = 0 and: [ (anObject instVarAt: index) notNil ]) ifTrue: [ ^ true ].
			(aMaObjectSerializer oidFor: (anObject instVarAt: index)) = (self maInstVarAt: instVarIndexInBackup) ifFalse: [ ^ true ] ] ].
	^ false