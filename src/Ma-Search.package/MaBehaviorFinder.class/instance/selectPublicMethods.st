methods
selectPublicMethods
	"Remove methods in a category beginning with the word 'private'."
	self rejectMethods: 
		[ : each | 
		each category 
			maBeginsWith: 'private'
			caseSensitive: false ]