accessing
keywords: anArray
	"Specify an Array of keywords.  There must be some level of match on all keywords for an object to be matched."
	self initializeKeywords.
	anArray ifNotEmpty: [ self orKeywords: anArray ]