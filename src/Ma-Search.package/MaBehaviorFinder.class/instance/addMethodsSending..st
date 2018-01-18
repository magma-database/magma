methods
addMethodsSending: selectorString 
	"Add all methods that send method named selectorString."
	| selectorSymbol |
	(Symbol 
		hasInterned: selectorString
		ifTrue: [ : sym | true ]) ifFalse: [ ^ self ].
	selectorSymbol := selectorString asSymbol.
	self systemNavigation allBehaviorsDo: 
		[ : eachClass | 
		eachClass methodsDo: 
			[ : eachCm | 
			(eachCm sendsSelector: selectorSymbol) ifTrue: 
				[ self addMethod: 
					(MethodReference 
						class: eachClass
						selector: eachCm selector) ] ] ]