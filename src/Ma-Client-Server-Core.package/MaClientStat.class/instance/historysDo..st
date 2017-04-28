enumerate
historysDo: aBlock 
	super historysDo: aBlock.
	{ 
		timeToConnectSocketHistory.
		timeToLoadBuffersHistory.
		timeToSendRequestsHistory.
		timeWaitingForResponsesHistory.
		timeReceivingResponsesHistory
	 } do: aBlock.
	timeToSubmitByRequestClassHistorys do: aBlock