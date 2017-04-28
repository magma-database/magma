private
processRequest: aMaServerRequestLifecycle 
	| responseByteArray |
	responseByteArray := doBlock value: aMaServerRequestLifecycle.
	server noteLastRequestFinish: (requestQueue isEmpty ifTrue: [ Time millisecondClockValue ]).
	(self isUdp not and: [ aMaServerRequestLifecycle requestObject wantsResponse ]) ifTrue: 
		[ self 
			sendData: responseByteArray
			using: aMaServerRequestLifecycle ]