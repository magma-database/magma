actions
submit: aMaClientServerRequest 
	"For async requests, once protocol is established it is simpler and probably higher-performance to not fork a separate process; because all we have to do is blast the bytes out over the network, which usually happens very quickly."
	^ (aMaClientServerRequest wantsResponse or: [ self protocolEstablished ]) 
		ifTrue: 
			[ submitGuard critical: 
				[ "ensure connected"
				self protocolEstablished ifFalse: [ self connect ].
				self primSubmit: aMaClientServerRequest ] ]
		ifFalse: 
			[ 
			[ submitGuard critical: 
				[ self connect.
				self primSubmit: aMaClientServerRequest ] ] newProcess
				name: 'async ' , aMaClientServerRequest printString ;
				resume.
			nil ]