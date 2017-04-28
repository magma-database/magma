methods
selectMethodsWithNamesContaining: aString 
	"Removes all but the method names that include subString aString."
	self selectMethods: 
		[ : each | 
		each selector asString 
			includesSubstring: aString
			caseSensitive: self isCaseSensitive ]