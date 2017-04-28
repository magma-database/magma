accessing
maOriginalClass
	"Do this because we can't use #species on me.  When I'm behind a WriteBarrier #class will answer an anonymous subclass of me."
	^ MaContextResultsContext