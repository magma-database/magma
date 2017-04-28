methods
selectMethodsContainingString: aString 
	"Select the methods containing aString in their source code."
	self selectMethods: 
		[ : each | 
		each sourceString notNil and: 
			[ each sourceString 
				includesSubstring: aString
				caseSensitive: self caseSensitive ] ]