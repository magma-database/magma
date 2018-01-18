as yet unclassified
benchKnownClasses: operation size: collectionSize
	| sel |
	
	sel := ('bench' , operation, ':size:') asSymbol.
	
	^ self knownClasses collect: [:cls |
			cls name -> (self new perform: sel withArguments: { cls. collectionSize })
		]

