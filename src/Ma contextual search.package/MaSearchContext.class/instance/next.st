subclass behavior
next
	"Answer the next object that should be evaluated against the keyword selection."

	"I keep track of my position (thus am meant to be used by a single Process at a time).  This method answers the next available element based on its current position.  If the subclass receiver has a way reducing the search-set and answering only the next that meets its selectionKey, it should.  Otherwise, they will be eliminated via serial searching."

	self subclassResponsibility