private-report generation
printProblemsWithClassDefinitionsBuffer: aMaObjectBuffer on: aWriteStream 
	| indexOfNonIntegerClassId indexOfInvalidUserOidClassDef |
	aMaObjectBuffer bufferType = MaVariableObjectBuffer basicNew bufferType ifFalse: 
		[ invalidClassDefinitionsBuffer := true.
		self 
			printInvalidOn: aWriteStream
			withMessage: 'The buffer should be a MaVariableObjectBuffer, it isn''t.'.
		^ self ].
	(aMaObjectBuffer objectInstSize even and: [ aMaObjectBuffer objectInstSize > 0 ]) ifFalse: 
		[ invalidClassDefinitionsBuffer := true.
		self 
			printInvalidOn: aWriteStream
			withMessage: 'This buffer should represent a Dictionary, so it should always have an even objectInstSize (key->value pairs).'.
		^ self ].
	indexOfNonIntegerClassId := 0.
	indexOfInvalidUserOidClassDef := 0.
	aMaObjectBuffer instVarsDoWithIndex: 
		[ : eachOid : index | 
		index odd 
			ifTrue: 
				[ (MaOidCalculator isOidForOptimizedInteger: eachOid) ifFalse: [ indexOfNonIntegerClassId := index ] ]
			ifFalse: 
				[ (MaOidCalculator isOidForUserObject: eachOid) ifFalse: [ indexOfInvalidUserOidClassDef := index ] ] ].
	indexOfNonIntegerClassId = 0 ifFalse: 
		[ invalidClassDefinitionsBuffer := true.
		self 
			printInvalidOn: aWriteStream
			withMessage: 'The class-definitions buffer should be a Dictionary with SmallIntegers as its keys.  This is not the case at instVar' , indexOfNonIntegerClassId printString ].
	indexOfInvalidUserOidClassDef = 0 ifFalse: 
		[ invalidClassDefinitionsBuffer := true.
		self 
			printInvalidOn: aWriteStream
			withMessage: 'The class-definitions buffer should be a Dictionary user objects (MaClassDefinitions) as its values.  This is not the case at instVar' , indexOfInvalidUserOidClassDef printString ]