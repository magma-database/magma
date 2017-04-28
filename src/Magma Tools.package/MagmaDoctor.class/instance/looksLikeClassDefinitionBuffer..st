private-report generation
looksLikeClassDefinitionBuffer: aMaObjectBuffer
	| stream |
	stream := WriteStream on: String new.
	self printProblemsWithClassDefinitionsBuffer: aMaObjectBuffer on: stream.
	^ stream isEmpty