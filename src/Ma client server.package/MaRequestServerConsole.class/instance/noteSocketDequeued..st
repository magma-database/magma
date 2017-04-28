notifications
noteSocketDequeued: aMaRequestLifecycle 
	self statistics isActive ifTrue: 
		[ self statistics
			decrementSocketsQueued ;
			recordTimeWaitingInSocketQueue: aMaRequestLifecycle timeWaitingInSocketQueue ]