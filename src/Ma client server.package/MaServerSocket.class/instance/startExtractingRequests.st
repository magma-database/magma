private
startExtractingRequests
	socketQueueMonitorProcess := 
	[ [ running or: [ socketQueue notEmpty ] ] whileTrue: 
		[ | requestLifecycle |
		requestLifecycle := socketQueue next.
		requestLifecycle noteSocketDequeued.
		server noteSocketDequeued: requestLifecycle.
		self extractByteArrayRequestsFrom: requestLifecycle.
		requestLifecycle := nil ].
	server noteNoLongerExtractingRequests ] newProcess
		name: 'socketQueue Monitor' ;
		priority: Processor userInterruptPriority ;
		resume.
	server note: 'ready to extract requests'