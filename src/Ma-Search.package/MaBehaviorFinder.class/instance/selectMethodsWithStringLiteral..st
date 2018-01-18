methods
selectMethodsWithStringLiteral: aString 
	"Select only the methods that have a String literal with subString, aString."
	self selectMethods: 
		[ : method | 
		method hasLiteralSuchThat: 
			[ : lit | 
			(lit isString and: [ lit isSymbol not ]) and: 
				[ lit 
					includesSubstring: aString
					caseSensitive: self isCaseSensitive ] ] ]