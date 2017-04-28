private
sendData: aByteArray using: aMaRequestLifecycle 
	[ | byteArrayToSend destinationSocket |
	destinationSocket := aMaRequestLifecycle socket.
	destinationSocket isConnected 
		ifTrue: 
			[ server noteTimeToLoadBuffers: (Time millisecondsToRun: [ byteArrayToSend := self byteArrayToSendFor: aByteArray ]).
			aMaRequestLifecycle responseByteArray: byteArrayToSend.
			aMaRequestLifecycle beginSendingResponse.
			server 
				noteSendingResponse: byteArrayToSend
				to: destinationSocket.
			
			[ destinationSocket
				sendData: byteArrayToSend ;
				waitForSendDoneFor: self timeoutSeconds ] 
				on: ConnectionTimedOut
				do: [ : exc | destinationSocket closeAndDestroy ].
			(destinationSocket isConnected and: [ destinationSocket sendDone ]) 
				ifTrue: 
					[ aMaRequestLifecycle doneSendingResponse.
					server noteResponseSent: aMaRequestLifecycle ]
				ifFalse: [ server noteClientTimedOut: aMaRequestLifecycle ] ]
		ifFalse: [ server noteClientTimedOut: aMaRequestLifecycle ] ] forkAt: Processor userInterruptPriority