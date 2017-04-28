methods
rejectMethodsWithStringLiteral: aString 
	"Remove methods that have a String literal with a substring, aString."
	self rejectMethods: 
		[ : method | 
		method hasLiteralSuchThat: 
			[ : lit | 
			(lit isString and: [ lit isSymbol not ]) and: 
				[ lit 
					includesSubstring: aString
					caseSensitive: self isCaseSensitive ] ] ]