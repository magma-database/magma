*ma object serialization
maEstablishPointerReferencesFor: aMaVariableObjectBuffer using: aMaObjectSerializer 
	1
		to: aMaVariableObjectBuffer objectInstSize
		do:
			[ : index | self add: (aMaObjectSerializer objectWithOid: (aMaVariableObjectBuffer maInstVarAt: index)) ]