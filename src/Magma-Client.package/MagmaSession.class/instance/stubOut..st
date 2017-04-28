performance
stubOut: anObject 
	"Convert anObject to a proxy, potentially freeing the objects it references for garbage collection.  Useful for keeping memory consumption under control."
	self stubOutAll: {anObject}