notifications
noteResponseSent: aMaRequestLifecycle 
	"Successfully sent the aMaRequestLifecycle's responseByteArray to its socket."
	self
		newLine ;
		showMessage: 'sent ' , aMaRequestLifecycle responseByteArray size printString , ' bytes to ' , (NetNameResolver stringFromAddress: aMaRequestLifecycle socket remoteAddress)