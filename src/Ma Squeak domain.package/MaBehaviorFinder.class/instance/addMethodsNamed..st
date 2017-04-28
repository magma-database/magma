methods
addMethodsNamed: aSymbol 
	"Add methods exactly named aSymbol."
	self systemNavigation allBehaviorsDo: 
		[ : eachClass | 
		eachClass selectorsDo: 
			[ : eachSelector | 
			(eachSelector = aSymbol) ifTrue: 
				[ self addMethod: 
					(MethodReference 
						class: eachClass
						selector: eachSelector) ] ] ]