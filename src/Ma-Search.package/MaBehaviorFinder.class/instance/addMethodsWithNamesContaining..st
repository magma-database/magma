methods
addMethodsWithNamesContaining: aString 
	"Add all methods in the system whose selector contains aString as a subString."
	self systemNavigation allBehaviorsDo: 
		[ : eachClass | 
		eachClass selectorsDo: 
			[ : eachSelector | 
			(eachSelector 
				includesSubstring: aString
				caseSensitive: self isCaseSensitive) ifTrue: 
				[ self addMethod:
					(MaMethodReference 
						class: eachClass
						selector: eachSelector) ] ] ]