notifications
noteSendResponse: aByteArray timedOutOn: aSocket 
	"aSocket must have disconnected or something, we couldn't get the response to them."
	self
		newLine ;
		showMessage: 'timed out trying to send ' , aByteArray size printString , ' bytes to ' , (NetNameResolver stringFromAddress: aSocket remoteAddress)