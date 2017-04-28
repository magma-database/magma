copying
postCopyForNewRequest
	"The lifecycle stat is instantiated upon the initial socket connection, then cloned for each request to have its own stats."
	requestQueueTime := nil.
	requestDequeueTime := nil.
	timeToExtractRequestBytes := nil.
	requestByteArray := nil.
	beginSendingResponseTime := nil.
	doneSendingResponseTime := nil.
	responseByteArray := nil