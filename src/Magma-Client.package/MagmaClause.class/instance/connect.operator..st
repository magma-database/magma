private
connect: aMaTerm operator: aSymbol 
	| answer |
	answer := super 
		connect: aMaTerm
		operator: aSymbol.
	self ensureFilteredReader.
	^ answer