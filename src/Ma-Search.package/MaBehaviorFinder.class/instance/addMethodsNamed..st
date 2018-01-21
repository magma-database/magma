methods
addMethodsNamed: aSymbol 
	"Add methods exactly named aSymbol."
	self systemNavigation allBehaviorsDo: 
		[ : eachClass | 
		eachClass selectorsDo: 
			[ : eachSelector | 
			(eachSelector = aSymbol) ifTrue: 
				[ self addMethod: 
					(MaMethodReference 
						class: eachClass
						selector: eachSelector) ] ] ]