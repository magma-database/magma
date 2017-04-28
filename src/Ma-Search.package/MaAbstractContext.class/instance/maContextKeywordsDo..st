private
maContextKeywordsDo: aBlock
	"This is used if the user is actually searching for a context.  In other words, the results of a context search will, themselves, be contexts presumably for themselves to be searched."
	aBlock value: self name