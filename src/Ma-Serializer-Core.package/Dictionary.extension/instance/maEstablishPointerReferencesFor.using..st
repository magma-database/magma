*ma-serializer-core
maEstablishPointerReferencesFor: aMaVariableObjectBuffer using: aMaObjectSerializer 
	| transformer |
	transformer := [ : oid | aMaObjectSerializer objectWithOid: oid ].
	1
		to: aMaVariableObjectBuffer objectInstSize
		by: 2
		do:
			[ : index | self maDirtyAdd:
				(self associationClass
					key: (transformer value: (aMaVariableObjectBuffer maInstVarAt: index))
					value: (transformer value: (aMaVariableObjectBuffer maInstVarAt: index + 1))) ]