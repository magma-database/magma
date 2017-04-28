notifications
noteSendingResponse: aByteArray to: aSocket 
	"a ByteArray is about to be sent to aSocket."
	self
		newLine ;
		showMessage: 'about to send ' , aByteArray size printString , ' bytes to ' , (NetNameResolver stringFromAddress: aSocket remoteAddress)