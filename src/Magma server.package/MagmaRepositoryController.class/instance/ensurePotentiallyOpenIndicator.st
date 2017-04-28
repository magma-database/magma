testing
ensurePotentiallyOpenIndicator
	self potentiallyOpenByAnotherOsProcess ifFalse:
		[ self directory
			maFileNamed: self class openIndicatorFilename
			do:
				[ : stream | "nothing, just create it" ] ]