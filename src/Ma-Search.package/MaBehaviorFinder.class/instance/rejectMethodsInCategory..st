categories
rejectMethodsInCategory: categoryString 
	"Remove methods whose category contains the sub-string, categoryString."
	self rejectMethods: 
		[ : each | 
		each category 
			includesSubstring: categoryString
			caseSensitive: self caseSensitive ]