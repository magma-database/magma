copying
copyForIndependentSearch
	"Each instance maintains current-processing information, i.e., what am I doing right now and where am I?  Therefore, if you need to perform more than one search of a single context at a time, use this method to make a copy of me and use that one."
	^ self copy postCopyForIndependentSearch