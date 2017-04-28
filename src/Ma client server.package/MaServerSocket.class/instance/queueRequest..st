private
queueRequest: aMaRequestLifecycle 
	running ifTrue: 
		[ aMaRequestLifecycle requestQueueTime: Time millisecondClockValue.
		server noteRequestsQueued: requestQueue size.
		self primQueueRequest: aMaRequestLifecycle.
		server noteRequestQueued: aMaRequestLifecycle ]