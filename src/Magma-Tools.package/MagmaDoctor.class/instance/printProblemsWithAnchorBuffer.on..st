private-report generation
printProblemsWithAnchorBuffer: aMaObjectBuffer on: aWriteStream 
	aMaObjectBuffer bufferType = MaFixedObjectBuffer basicNew bufferType ifFalse: 
		[ invalidAnchorBuffer := true.
		self 
			printInvalidOn: aWriteStream
			withMessage: 'The buffer should be a MaFixedObjectBuffer, it isn''t.' ].
	aMaObjectBuffer objectInstSize = MaRootAnchor instSize ifFalse: 
		[ invalidAnchorBuffer := true.
		self 
			printInvalidOn: aWriteStream
			withMessage: 'This buffer should represent a MaRootAnchor, but its instSize isn''t right for that' ]