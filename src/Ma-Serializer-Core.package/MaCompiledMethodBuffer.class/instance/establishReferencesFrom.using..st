creation
establishReferencesFrom: anObject using: aMaObjectSerializer 
	1
		to: anObject maInstSize
		do:
			[ : instVarIndex | 
			anObject
				literalAt: instVarIndex
				put: (aMaObjectSerializer objectWithOid: (self maInstVarAt: instVarIndex)) realObjectIfMutatingProxy ]