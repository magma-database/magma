accessing
keywordsString: aString 
	"Specify one or keywords.  There must be at least a partial match on all keywords for an object to be matched."
	self
		keywords: (self keywordsIn: aString) ;
		refresh