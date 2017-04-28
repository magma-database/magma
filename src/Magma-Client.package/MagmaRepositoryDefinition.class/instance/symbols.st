accessing
symbols
	"All Symbols referenced in this repository.  It's helpful to canonicalize them here, so that clients will always know about them rather than creating new instances of Symbols in the DB just because they hadn't yet encountered a particular Symbol."
	^ symbols ifNil: [ symbols := Set new ]