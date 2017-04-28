private-report generation
printCrucialBuffersOn: aWriteStream 
	self
		printClassDefinitionsBufferOn: aWriteStream ;
		printDefinitionBufferOn: aWriteStream ;
		printAnchorBufferOn: aWriteStream