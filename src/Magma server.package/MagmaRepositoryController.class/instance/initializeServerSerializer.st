initializing
initializeServerSerializer
	"Why is this separate, 'serverSerializer' needed?  Because the session serializer requires a different traversalStrategy.  The serverSerializer needs to be able to fully serialize, to the ends of the graphs, the 'response' objects of various requests."

	serverSerializer := self session serializer copyWithNewBuffer initializeTraversalStrategy
