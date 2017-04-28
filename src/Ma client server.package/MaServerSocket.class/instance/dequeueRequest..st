private
dequeueRequest: requestLifecycle 
	requestLifecycle requestDequeueTime: Time millisecondClockValue.
	server noteRequestDequeued: requestLifecycle.
	^ requestLifecycle