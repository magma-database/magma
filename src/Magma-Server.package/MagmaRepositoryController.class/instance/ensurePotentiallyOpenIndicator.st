testing
ensurePotentiallyOpenIndicator
	localLocation isPotentiallyOpen ifFalse:
		[ self directory
			maFileNamed: self class openIndicatorFilename
			do:
				[ : stream | "nothing, just create it" ] ]