private
startProcessingRequests
	processRequestProcess := 
	[ [ running ] whileTrue: 
		[ [ self processRequest: (self dequeueRequest: requestQueue next) ] 
			on: Error
			do: 
				[ : err | 
				MaClientServerPreferences debug 
					ifTrue: [ err pass ]
					ifFalse: 
						[ MaClientServerNotification signal: 'ERROR PROCESSING REQUEST!!!  (See SERVER-ERROR.log)'.
						Smalltalk 
							logError: err description
							inContext: err signalerContext
							to: 'SERVER-ERROR.log' ] ] ].
	console noteNoLongerProcessingRequests ] newProcess
		name: 'Request processor' ;
		priority: Processor userSchedulingPriority+1 ;
		resume.
	console note: 'ready to process requests'