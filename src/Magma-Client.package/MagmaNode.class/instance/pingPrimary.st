testing
pingPrimary
	"Answer the commitNumber of the primary repository, if it can be.  Otherwise, signal an error (probably NetworkError)."
	^ self ping: self primaryLocation