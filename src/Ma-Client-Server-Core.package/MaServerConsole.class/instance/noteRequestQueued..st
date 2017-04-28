notifications
noteRequestQueued: aMaRequestLifecycle 
	"The aMaRequestLifecycle's now has a requestByteArray that has been extracted from its socket.  The requestByteArray has now been appended to the end of the requestQueue."
	self statistics isActive ifTrue: 
		[ self statistics recordRequestSize: aMaRequestLifecycle requestByteArray size ]