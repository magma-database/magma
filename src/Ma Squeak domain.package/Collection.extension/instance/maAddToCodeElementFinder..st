*ma squeak domain
maAddToCodeElementFinder: aMaCodeElementFinder 
	self do: [ : each | each maAddToCodeElementFinder: aMaCodeElementFinder ]