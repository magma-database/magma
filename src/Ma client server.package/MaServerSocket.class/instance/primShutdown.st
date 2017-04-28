private
primShutdown
	running := false.
	server note: 'new sockets no longer accepted.'.
	socketQueue isEmpty ifFalse: [ server note: 'waiting for queued sockets..' ].
	[ socketQueue isEmpty ] whileFalse: [ (Delay forSeconds: 1) wait ].
	socketQueueMonitorProcess ifNotNilDo: [ : proc | proc terminate ].
	requestQueue isEmpty ifFalse: [ server note: 'waiting for pending requests to process..' ].
	[ processRequestProcess isTerminated or: [ requestQueue isEmpty ] ] whileFalse: [ (Delay forSeconds: 1) wait ].
	processRequestProcess terminate.
	server note: 'deallocating resources.'.
	socket ifNotNil: [ socket closeAndDestroy: self timeoutSeconds ].
	self initializeQueues.
	socket := nil