*ma-search
maAddToCodeElementFinder: aMaCodeElementFinder 
	self do: [ : each | each maAddToCodeElementFinder: aMaCodeElementFinder ]