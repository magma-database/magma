labels
trimYlabelsTo: numberNeeded 
	[ yLabels size <= numberNeeded ] whileFalse: [ yLabels removeLast delete ]