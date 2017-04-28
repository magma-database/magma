actions
monitorForUdpByteArrayRequests
	"Kickoff a new iterating process for the purpose of listening for requests bytes from UDP clients.  receiveOneByteArrayRequestFrom: waits a few seconds on the port, if data comes in it will extract the entire request and return it.  Otherwise it returns nil and the loop can check for shutdown or expiry."
	extractProcess := 
	[ [ self shouldContinue ] whileTrue: 
		[ | requestByteArray |
		requestByteArray := [ self receiveOneUdpRequestFrom: lifecycle ] 
			on: Error
			do: 
				[ : exc | 
				self console 
					noteException: exc
					whileReceivingRequestFrom: lifecycle.
				self shouldContinue: false.
				nil ].
		requestByteArray ifNotNil: 
			[ | newLifecycle |
			newLifecycle := lifecycle copyForNewRequest
				requestByteArray: requestByteArray ;
				yourself.
			serverSocket queueRequest: newLifecycle ] ] ] newProcess.
	extractProcess
		name: 'extracting requests from UDP clients' ;
		priority: Processor userInterruptPriority ;
		resume