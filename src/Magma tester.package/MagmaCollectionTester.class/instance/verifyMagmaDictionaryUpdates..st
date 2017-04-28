test MagmaDictionary
verifyMagmaDictionaryUpdates: className
	clientSession refresh.
	self verifyMagmaDictAfterUpdates: (clientSession root at: ('test' , className) asSymbol)