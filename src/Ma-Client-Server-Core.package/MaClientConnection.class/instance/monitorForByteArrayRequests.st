actions
monitorForByteArrayRequests
	"A socket connection has just been established.  Kickoff a new iterating process for the purpose of listening for requests bytes from a single client (my lifecycles #socket).  receiveOneByteArrayRequestFrom: waits a few seconds on the port, if data comes in it will extract the entire request and return it.  Otherwise it returns nil and the loop can check for shutdown or expiry."
	extractProcess := [ [ self shouldContinue and: [ lifecycle socketStream isConnected ] ] whileTrue:
		[ | requestByteArray |
		requestByteArray := [ self receiveOneByteArrayRequestFrom: lifecycle ]
			on: Error
			do:
				[ : exc | self console
					noteException: exc
					whileReceivingRequestFrom: lifecycle.
				self shouldContinue: false.
				nil ].
		requestByteArray ifNotNil:
			[ | newLifecycle |
			newLifecycle := lifecycle copyForNewRequest
				 requestByteArray: requestByteArray ;
				 yourself.
			serverSocket queueRequest: newLifecycle ] ].
	lifecycle critical:
		[ lifecycle socket closeAndDestroy: serverSocket timeoutSeconds.
		lifecycle socketStream resetBuffers.
		serverSocket removeConnection: self ] ] newProcess.
	extractProcess
		 name: 'extracting requests from ' , lifecycle remotePort asString ;
		 priority: Processor userInterruptPriority ;
		 resume