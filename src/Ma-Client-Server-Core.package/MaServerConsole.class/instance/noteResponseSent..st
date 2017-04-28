notifications
noteResponseSent: aMaRequestLifecycle 
	"Successfully sent the aMaRequestLifecycle's responseByteArray to its socket."
	self statistics
		recordResponseSize: aMaRequestLifecycle responseByteArray size ;
		recordTimeToSendResponse: aMaRequestLifecycle timeToSendResponse ;
		recordSuccessfulLifecycle