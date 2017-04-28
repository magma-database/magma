methods
rejectMethodsWithNamesContaining: aString 
	"Removes all methods whose names that include subString aString."
	self rejectMethods: 
		[ : each | 
		each selector asString 
			includesSubstring: aString
			caseSensitive: self isCaseSensitive ]