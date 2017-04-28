categories
rejectMethodsInCategory: categoryString 
	"Remove methods whose category contains the sub-string, categoryString."
	self rejectMethods: 
		[ : each | 
		each maCategory 
			includesSubstring: categoryString
			caseSensitive: self caseSensitive ]