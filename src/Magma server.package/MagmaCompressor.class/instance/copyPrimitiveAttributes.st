private
copyPrimitiveAttributes
	| inputFiler |
	inputFiler := inputController repository filer.
	inputController requestCritical: 
		[ outputFiler primitiveAttributeAddressesMap keysAndValuesDo: 
			[ : eachKey : eachValue | 
			eachKey isSymbol ifTrue: 
				[ outputFiler 
					perform: (eachKey , ':') asSymbol
					with: (inputFiler perform: eachKey) ] ] ]