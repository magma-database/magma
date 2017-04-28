private-report generation
printClassDefinitionsBufferOn: aWriteStream 
	| buffer |
	self 
		printHeading: 'The Class-Definitions Buffer'
		on: aWriteStream.
	buffer := self filer bufferFor: self filer classDefinitionsOid.
	self 
		printFieldNamed: 'oid'
		value: buffer oid
		on: aWriteStream.
	self 
		printFieldNamed: 'bufferType'
		value: buffer bufferType
		on: aWriteStream.
	self 
		printFieldNamed: #objectInstSize
		value: buffer objectInstSize
		on: aWriteStream.
	self 
		printFieldNamed: #classId
		value: buffer classId
		on: aWriteStream.
	self 
		printProblemsWithClassDefinitionsBuffer: buffer
		on: aWriteStream.
	invalidClassDefinitionsBuffer ifTrue: [ self printPotentialClassDefinitionsBuffersOn: aWriteStream ]