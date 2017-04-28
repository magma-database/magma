*ma squeak domain
maCategoryOfElement: selectorSymbol
	"Answer the category associated with the argument, element."

	^(organization categoryOfElement: selectorSymbol)
		ifNil:
			[ superclass
				ifNil: [ nil ]
				ifNotNil: [ superclass maCategoryOfElement: selectorSymbol ] ]