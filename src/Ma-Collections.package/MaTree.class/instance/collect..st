enumerating
collect: aBlock
	"Returns a new tree whose nodes have all been operated on by aBlock."
	^self
		collect: aBlock
		into: self maOriginalClass new