categories
selectMethodsInCategory: categoryString 
	"Remove methods not in a category whose name includes the sub-string, categoryString."
	self selectMethods: 
		[ : each | 
		each category 
			includesSubstring: categoryString
			caseSensitive: self caseSensitive ]