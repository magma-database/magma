private-report generation
printProblemsWithDefinitionBuffer: aMaObjectBuffer on: aWriteStream 
	aMaObjectBuffer bufferType = MaFixedObjectBuffer basicNew bufferType ifFalse: 
		[ invalidDefinitionBuffer := true.
		self 
			printInvalidOn: aWriteStream
			withMessage: 'The buffer should be a MaFixedObjectBuffer, it isn''t.' ].
	aMaObjectBuffer objectInstSize = MagmaRepositoryDefinition instSize ifFalse: 
		[ invalidDefinitionBuffer := true.
		self 
			printInvalidOn: aWriteStream
			withMessage: 'This buffer should represent a MagmaRepositoryDefinition, but its instSize isn''t right for that' ]