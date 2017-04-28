initialize-release
initialize
	super initialize.
	timeToSubmitByRequestClassHistorys := Dictionary new.
	timeToConnectSocketHistory := MaStatHistory name: 'Time to Connect Sockets to Server'.
	timeToLoadBuffersHistory := MaStatHistory name: 'Time to Load Buffers'.
	timeToSendRequestsHistory := MaStatHistory name: 'Time to Send Requests'.
	timeWaitingForResponsesHistory := MaStatHistory name: 'Time for Initial Response'.
	timeReceivingResponsesHistory := MaStatHistory name: 'Time to Download Full Response'