private-report generation
printPotentialDefinitionBuffersOn: aWriteStream 
	self 
		printHeading: 'Candidates for the real Definition buffer'
		on: aWriteStream.
	self potentialDefinitionBuffers do: 
		[ : each | 
		aWriteStream
			cr ;
			tab ;
			maPrint: each ]