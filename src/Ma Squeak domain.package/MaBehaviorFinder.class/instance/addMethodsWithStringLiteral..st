methods
addMethodsWithStringLiteral: aString 
	self addMethods:
		(self systemNavigation allMethodsSelect: 
			[ : method | 
			method hasLiteralSuchThat: 
				[ : lit | 
				(lit isString and: [ lit isSymbol not ]) and: 
					[ lit 
						includesSubstring: aString
						caseSensitive: self isCaseSensitive ] ] ])