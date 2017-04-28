*ma object serialization
maEstablishPointerReferencesFor: aMaVariableObjectBuffer using: aMaObjectSerializer 
	| transformer |
	transformer := [ : oid | aMaObjectSerializer objectWithOid: oid ].
	1
		to: aMaVariableObjectBuffer objectInstSize
		by: 2
		do:
			[ : index | self
				at: (transformer value: (aMaVariableObjectBuffer maInstVarAt: index))
				put: (transformer value: (aMaVariableObjectBuffer maInstVarAt: index + 1)) ]