notifications
noteSocketDequeued: aMaRequestLifecycle 
	self statistics isActive ifTrue: 
		[ self statistics
			recordTimeWaitingInSocketQueue: aMaRequestLifecycle timeWaitingInSocketQueue ]