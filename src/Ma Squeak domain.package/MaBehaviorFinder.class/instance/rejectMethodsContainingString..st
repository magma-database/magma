methods
rejectMethodsContainingString: aString 
	"Reject the methods containing aString in their source code."
	self rejectMethods: 
		[ : each | 
		each sourceString notNil and: 
			[ each sourceString 
				includesSubstring: aString
				caseSensitive: self isCaseSensitive ] ]