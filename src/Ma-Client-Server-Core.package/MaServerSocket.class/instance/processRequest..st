private
processRequest: aMaServerRequestLifecycle 
	| responseByteArray time |
	responseByteArray := doBlock value: aMaServerRequestLifecycle.
	time := Time millisecondClockValue.
	aMaServerRequestLifecycle clientConnection lastAccess: time.
	console noteLastRequestFinish: (requestQueue isEmpty ifTrue: [ time ]).
	"aMaServerRequestLifecycle requestObject will be nil for ByteArray servers, which means TCP ByteArray servers must always provide a response."
	(self isUdp not and: [ aMaServerRequestLifecycle requestObject wantsResponse ]) ifTrue:
		[ aMaServerRequestLifecycle responseByteArray: responseByteArray.
		self sendResponseFor: aMaServerRequestLifecycle ]