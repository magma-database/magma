private
primShutdown
	running := false.
	console note: 'Server is shutting down right now.'.
	[ socketQueue isEmpty ] whileFalse: [ (Delay forSeconds: 1) wait ].
	socketQueueMonitorProcess ifNotNil:
		[ : proc | proc terminate ].
	processRequestProcess ifNotNil: [processRequestProcess terminate].
	socket ifNotNil: [ socket closeAndDestroy: self timeoutSeconds ].
	self initializeQueues.
	socket := nil