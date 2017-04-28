methods
selectPrivateMethods
	"Remove methods not in a category beginning with the word 'private'."
	self selectMethods: 
		[ : each | 
		each maCategory 
			maBeginsWith: 'private'
			caseSensitive: false ]