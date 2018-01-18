private
historysDo: aBlock 
	super historysDo: aBlock.
	{ 
		socketsQueuedHistory.
		timeWaitingInSocketQueueHistory.
		extractTimeHistory.
		requestsQueuedHistory.
		timeWaitingInRequestQueueHistory.
		requestSizeHistory.
		requestProcessingTimeHistory.
		responseSizeHistory.
		timeToSendResponsesHistory.
		clientTimeoutsHistory.
		numberOfClientConnectionsHistory.
		timeToLoadBuffersHistory.
		idleTimeHistory
	 } do: aBlock.
	requestProcessingTimeHistorys do: aBlock