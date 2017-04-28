private
startProcessingRequests
	processRequestProcess := 
	[ [ running or: [ requestQueue notEmpty ] ] whileTrue: 
		[ [ self processRequest: self dequeueByteArrayRequest ] 
			on: Error
			do: 
				[ : err | 
				MaClientServerPreferences debug 
					ifTrue: [ err pass ]
					ifFalse: 
						[ "Ok, let's be extra aggressive in not letting server crash.  If one request generates an unexpected error, just log it and discard, but still process subsequent requests."
						Smalltalk 
							logError: err description
							inContext: err signalerContext
							to: 'SqueakDebug.log' ] ] ].
	server noteNoLongerProcessingRequests ] newProcess
		name: 'Request processor' ;
		resume.
	server note: 'ready to process requests'