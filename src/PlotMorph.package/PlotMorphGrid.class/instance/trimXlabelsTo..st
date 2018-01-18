labels
trimXlabelsTo: numberNeeded 
	[ xLabels size <= numberNeeded ] whileFalse: [ xLabels removeLast delete ]