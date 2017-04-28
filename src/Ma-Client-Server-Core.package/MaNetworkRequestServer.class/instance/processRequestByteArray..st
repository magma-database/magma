private
processRequestByteArray: aMaServerRequestLifecycle 
	"Materialize the object serialized in requestByteArray, and serialize the response I get from telling my processor to process it."
	| requestObject responseObject |
	[ requestObject := self materializeRequest: aMaServerRequestLifecycle requestByteArray.
	aMaServerRequestLifecycle requestObject: requestObject ]
		on: Error
		do:
			[ : exc | MaClientServerPreferences debug
				ifTrue: [ exc pass ]
				ifFalse: [ ^ self serializeResponse:
						(MaMalformedRequestError new
							 messageText: exc messageText ;
							 yourself) ] ].
	requestObject isString ifFalse: [ requestObject lifecycle: aMaServerRequestLifecycle ].
	responseObject := self processRequest: requestObject.
	^ (requestObject wantsResponse and: [ self isUdp not ]) ifTrue:
		[ [ self serializeResponse: responseObject ]
			maOn: OutOfMemory
			do:
				[ : err | processor
					noteResponseSerializationError: err
					lifecycle: aMaServerRequestLifecycle.
				self serializeResponse: (MaEnvironmentError messageText: 'Server out of RAM while trying to serialize response.') ]
			on: MaObjectSerializationWarning
			do:
				[ : err | self serializeResponse: (MaEnvironmentError messageText: 'Response size exceeds serializer sizeWarningThreshold of ' , MaSerializedGraphBuffer sizeWarningThreshold asBytesDescription) ] ]