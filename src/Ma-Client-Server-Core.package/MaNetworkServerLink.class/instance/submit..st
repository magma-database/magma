actions
submit: aMaClientServerRequest 
	^ submitGuard critical:
		[ aMaClientServerRequest wantsResponse
			ifTrue:
				[ self protocolEstablished ifFalse: [ self connect ].
				self primSubmit: aMaClientServerRequest ]
			ifFalse:
				[ self primSubmit: aMaClientServerRequest.
				nil ] ]