historys
networkStats
	"Statistics related to the networking."
	^ { 
		timeToConnectSocketHistory.
		timeToLoadBuffersHistory.
		timeToSendRequestsHistory.
		timeWaitingForResponsesHistory.
		timeReceivingResponsesHistory
	 }