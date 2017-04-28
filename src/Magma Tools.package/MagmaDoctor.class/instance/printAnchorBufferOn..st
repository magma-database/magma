private-report generation
printAnchorBufferOn: aWriteStream 
	| buffer |
	self 
		printHeading: 'The Anchor Buffer'
		on: aWriteStream.
	buffer := self filer bufferFor: self filer anchorOid.
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
		printProblemsWithAnchorBuffer: buffer
		on: aWriteStream.
"	invalidAnchorBuffer ifTrue: [ self printPotentialAnchorBuffersOn: aWriteStream ]"