copying
postCopyForNewRequest
	"The lifecycle stat is instantiated upon the initial socket connection, then cloned for each request to have its own stats."
	requestQueueTime := requestDequeueTime := requestByteArray := beginSendingResponseTime := doneSendingResponseTime := responseByteArray := nil