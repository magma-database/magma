test MagmaDictionary
verifyMagmaDictionaryAccess: className
	| dict |
	clientSession begin.
	dict := clientSession root at: ('test', className) asSymbol.
	self verifyMagmaDictBeforeUpdates: dict.
	"Replace a value...  Add a value."
	dict
		
		at: 450 asWords
		put: 450 asWords asUppercase ;
		
		at: 650 asWords
		put: 650.
	"Test two objects with same hash, one persistent, one not, then both persistent."
	self assert: 350 asWords hash = 350 asWords hash hash.
	dict
		at: 350 asWords hash
		put: 'other 350'.
	"anInteger"
	self verifyMagmaDictAfterUpdates: dict.
	clientSession commit