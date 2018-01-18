notifications
noteRequestDequeued: aMaRequestLifecycle 
	"Indicates aSocket has delivered a ByteArray request that is about to be processed by my server."
	self statistics isActive ifTrue: 
		[ self statistics
			recordTimeWaitingInRequestQueue: aMaRequestLifecycle timeWaitingInRequestQueue.
		"Only record idleTime if there was a wait since the last request."
		lastRequestFinish ifNotNil: 
			[ self statistics recordIdleTime: 
				(Time 
					milliseconds: aMaRequestLifecycle requestQueueTime
					since: lastRequestFinish).
			self noteLastRequestFinish: nil ] ]