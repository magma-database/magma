private-report generation
printPotentialClassDefinitionsBuffersOn: aWriteStream 
	self 
		printHeading: 'Candidates for the real ClassDefinitions buffer'
		on: aWriteStream.
	self potentialClassDefinitionBuffers do: 
		[ : each | 
		aWriteStream
			cr ;
			tab ;
			maPrint: each ]