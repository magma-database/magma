private-report generation
looksLikeDefinitionBuffer: aMaObjectBuffer 
	| stream |
	stream := WriteStream on: String new.
	self 
		printProblemsWithDefinitionBuffer: aMaObjectBuffer
		on: stream.
	^ stream isEmpty