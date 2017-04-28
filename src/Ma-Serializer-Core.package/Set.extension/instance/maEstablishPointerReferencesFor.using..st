*ma-serializer-core
maEstablishPointerReferencesFor: aMaVariableObjectBuffer using: aMaObjectSerializer 
	1
		to: aMaVariableObjectBuffer objectInstSize
		do:
			[ : index | self maDirtyAdd: (aMaObjectSerializer objectWithOid: (aMaVariableObjectBuffer maInstVarAt: index)) ]