private
valueOfAttribute: attributeSymbol ifAbsent: aBlock
	^ attributes 
		at: attributeSymbol
		ifAbsent: aBlock