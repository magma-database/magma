testing
hasParentFor: anObject 
	"Returns true if anObject has a parent.  Signal an error if anObject is not part of the hierarchy."
	^ (self parentOf: anObject) notNil