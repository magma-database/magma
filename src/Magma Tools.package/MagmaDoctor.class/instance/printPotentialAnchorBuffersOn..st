private-report generation
printPotentialAnchorBuffersOn: aWriteStream 
	self 
		printHeading: 'Candidates for the real AnchorBuffer'
		on: aWriteStream.
	self potentialAnchorBuffers do: 
		[ : each | 
		aWriteStream
			cr ;
			tab ;
			maPrint: each ]