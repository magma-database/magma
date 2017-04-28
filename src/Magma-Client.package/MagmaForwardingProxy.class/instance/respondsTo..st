testing
respondsTo: aSymbol 
	"Serialization wants to know whether I #respondsTo: aSymbol."
	^ (self class canUnderstand: aSymbol) or: [ self realObject respondsTo: aSymbol ]