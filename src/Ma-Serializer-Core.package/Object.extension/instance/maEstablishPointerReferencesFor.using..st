*ma-serializer-core
maEstablishPointerReferencesFor: aMaVariableObjectBuffer using: aMaObjectSerializer 
	self class isPointers ifFalse: [ "don't need to do this."	^ self ].
	1
		to: aMaVariableObjectBuffer objectInstSize
		do:
			[ : index | self
				slotAt: index
				put: (aMaObjectSerializer objectWithOid: (aMaVariableObjectBuffer maInstVarAt: index)) ]