private
processRequestByteArray: aMaServerRequestLifecycle 
	"Materialize the object serialized in requestByteArray, and serialize the response I get from telling my processor to process it."
	| requestObject responseObject |
	[ requestObject := self materializeRequest: aMaServerRequestLifecycle requestByteArray.
	aMaServerRequestLifecycle requestObject: requestObject ] 
		on: Error
		do: 
			[ : exc | 
			MaClientServerPreferences debug 
				ifTrue: [ exc pass ]
				ifFalse: 
					[ ^ self serializeResponse: (MaMalformedRequestError new
							messageText: exc messageText ;
							yourself) ] ].
	self connectionRequest = requestObject ifFalse: [ requestObject lifecycle: aMaServerRequestLifecycle ].
	responseObject := self processRequest: requestObject.
	^ (requestObject wantsResponse and: [ self isUdp not ]) ifTrue: [ self serializeResponse: responseObject ]