classes
rejectClassesNamed: classNameArgumentSubstring 
	"Filter out all methods in the receiver that belong to one of the classes whose names contain classNameArgumentSubstring."
	self rejectMethods: 
		[ : each | 
		each actualClass name 
			includesSubstring: classNameArgumentSubstring
			caseSensitive: self isCaseSensitive ]