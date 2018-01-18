private
sendResponseFor: aMaServerRequestLifecycle 
	[ aMaServerRequestLifecycle critical:
		[ | byteArrayToSend writeStream header |
		writeStream := aMaServerRequestLifecycle socketStream.
		writeStream isConnected
			ifTrue:
				[ aMaServerRequestLifecycle noteTimeAboutToSendResponse.
				byteArrayToSend := self byteArrayToSendFor: aMaServerRequestLifecycle responseByteArray.
				header := self
					sequenceNumber: aMaServerRequestLifecycle sequenceNumber
					totalToSend: byteArrayToSend size + self headerSize
					compressed: aMaServerRequestLifecycle responseByteArray ~~ byteArrayToSend.
				console
					noteSendingResponse: byteArrayToSend
					to: writeStream.
				[ writeStream
					 nextPutAll: header ;
					 nextPutAll: byteArrayToSend ;
					 flush.
				writeStream socket waitForSendDoneFor: self timeoutSeconds.
				aMaServerRequestLifecycle noteTimeJustFinishedSendingResponse.
				console noteResponseSent: aMaServerRequestLifecycle ]
					on: ConnectionTimedOut
					do:
						[ : exc | writeStream socket closeAndDestroy: preferences timeoutSeconds ].
				writeStream isConnected
					ifTrue: [ aMaServerRequestLifecycle bePriorLifecycle ]
					ifFalse: [ console noteClientTimedOut: aMaServerRequestLifecycle ] ]
			ifFalse: [ console noteClientTimedOut: aMaServerRequestLifecycle ] ] ] forkAt: Processor userInterruptPriority