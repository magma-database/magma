*magma server
shouldBePrimary
	"This request should only run on the primary server.  If I am in restoreMode (not the primary) then ping the primary to see whether it is still there.  If it isn't, take over, otherwise signal a MagmaWrongServerError back to the client."
	self isSecondary ifTrue: 
		[ 
		[ self node pingPrimary.
		MagmaWrongServerError new
			correctServer: self node primaryLocation ;
			signal ] 
			on: NetworkError
			do: 
				[ : netErr | 
				console ifNotNil: 
					[ "Wait briefly for any further MaWriteRequests to arrive over the network, THEY must be processed before the NodeUpdate if they are present."
					
					[ | writeRequests serverSocket |
					(Delay forMilliseconds: 1800) wait.
					writeRequests := OrderedCollection new.
					serverSocket := self serverSocket.
					serverSocket requestQueue flushAllSuchThat: 
						[ : eachLifecycle | 
						| requestObject |
						requestObject := console server materializeRequest: eachLifecycle requestByteArray.
						requestObject isWriteRequest 
							ifTrue: 
								[ MagmaNotification signal: 'Found a WriteRequest in teh queue!'.
								eachLifecycle requestObject: requestObject.
								serverSocket dequeueRequest: eachLifecycle.
								writeRequests add: eachLifecycle.
								true ]
							ifFalse: [ false ] ].
					writeRequests := writeRequests asSortedCollection: 
						[ : a : b | 
						a commitLogRecord commitNumber < b commitLogRecord commitNumber ].
					writeRequests do: [ : each | serverSocket processRequest: each ] ] 
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
				MagmaNodeUpdate new
					remove: self node primaryLocation ;
					setPrimary: console thisLocation ;
					processUsing: console ] ]