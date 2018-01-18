private
dequeueRequest: requestLifecycle 
	requestLifecycle requestDequeueTime: Time millisecondClockValue.
	console noteRequestDequeued: requestLifecycle.
	^ requestLifecycle