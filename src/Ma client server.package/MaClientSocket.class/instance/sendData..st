send
sendData: requestByteArray 
	^ self 
		sendData: requestByteArray
		startingAt: 1
		count: requestByteArray size
		waitForReplyIn: (self isUdp ifFalse: [ ByteArray new: 500 ])