private
startExtractingRequests
	socketQueueMonitorProcess := 
	[ [ running ] whileTrue: 
		[ | requestLifecycle |
		requestLifecycle := socketQueue next.
		requestLifecycle noteSocketDequeued.
		console noteSocketDequeued: requestLifecycle.
		self extractByteArrayRequestsFrom: requestLifecycle.
		requestLifecycle := nil ].
	console noteNoLongerExtractingRequests ] newProcess
		name: 'socketQueue Monitor' ;
		priority: Processor userInterruptPriority ;
		resume.
	console note: 'ready to extract requests'