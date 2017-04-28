private
queueRequest: aMaRequestLifecycle 
	running ifTrue: 
		[ aMaRequestLifecycle requestQueueTime: Time millisecondClockValue.
		console noteRequestsQueued: requestQueue size.
		self primQueueRequest: aMaRequestLifecycle.
		console noteRequestQueued: aMaRequestLifecycle ]