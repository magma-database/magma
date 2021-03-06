private
startAcceptingRequests
	| clientSocket |
	
	[ [ running ] whileTrue: 
		[ clientSocket := socket 
			waitForAcceptFor: 5 "seconds to wait for server to shutdown, if asked"
			ifTimedOut: [ nil ].
		(clientSocket notNil and: [ clientSocket isConnected ]) ifTrue: [ self queueSocket: clientSocket ] ].
	console noteNoLongerAcceptingRequests ] newProcess
		name: 'Socket acceptor' ;
		priority: Processor userInterruptPriority ;
		resume.
	console note: 'Ready to queue sockets'