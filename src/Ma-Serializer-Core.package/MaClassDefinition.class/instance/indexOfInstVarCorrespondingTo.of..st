accessing
indexOfInstVarCorrespondingTo: instVarIndex of: anotherMaClassDefinition
	"Answer the index of the instVar in me that corresponds to the one at instVarIndex in anotherMaClassDefinition."

	self == anotherMaClassDefinition ifTrue: [ ^ instVarIndex ].
	"different versions, determine if instVarIndex refers to a named or indexed var"
	^ instVarIndex > anotherMaClassDefinition allInstVarNames size
		ifTrue:
			[ "indexed inst var" 
			self allInstVarNames size + (instVarIndex - anotherMaClassDefinition allInstVarNames size) ]
		ifFalse:
			[ "find the instVar with the same name."
			self allInstVarNames
				indexOf: (anotherMaClassDefinition allInstVarNames at: instVarIndex) ]