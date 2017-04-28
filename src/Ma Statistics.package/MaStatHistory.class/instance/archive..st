copying
archive: aTimespan 
	^ self guard critical: 
		[ self archivalCopy
			selectHistory: [ : each | aTimespan includes: each timeSpan ] ;
			yourself ]