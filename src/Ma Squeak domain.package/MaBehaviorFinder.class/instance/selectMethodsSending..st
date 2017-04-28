methods
selectMethodsSending: selectorString 
	"Remove all methods that don't send selectorString."
	| selectorSymbol |
	(Symbol 
		hasInterned: selectorString
		ifTrue: [ : sym | true ]) ifFalse: [ ^ self ].
	selectorSymbol := selectorString asSymbol.
	self selectMethods: [ : each | each maActualMethod sendsSelector: selectorSymbol ]