testing
hasChildFor: anObject 
	"Returns true if anObject has any children.  Signal an error if anObject is not part of the hierarchy."
	^ parents includes: anObject