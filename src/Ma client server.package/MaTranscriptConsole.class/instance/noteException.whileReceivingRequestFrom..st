notifications
noteException: anException whileReceivingRequestFrom: aMaRequestLifecycle 
	"anException was signaled when trying to read from aSocket.  Maybe they disconnected?"
	self 
		noteException: anException
		onSocket: aMaRequestLifecycle