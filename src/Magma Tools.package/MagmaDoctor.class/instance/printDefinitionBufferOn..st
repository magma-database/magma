private-report generation
printDefinitionBufferOn: aWriteStream 
	| buffer |
	self 
		printHeading: 'The Repository-Definition Buffer'
		on: aWriteStream.
	buffer := self filer bufferFor: self filer definitionOid.
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
		printProblemsWithDefinitionBuffer: buffer
		on: aWriteStream.
	"invalidDefinitionBuffer ifTrue: [ self printPotentialDefinitionBuffersOn: aWriteStream ]"