initialize-release
initialize
	super initialize.
	socketsQueuedHistory := MaStatHistory name: 'Sockets Queued'.
	requestsQueuedHistory := MaStatHistory name: 'Requests Queued'.
	requestSizeHistory := MaStatHistory name: 'Request Sizes'.
	requestProcessingTimeHistory := MaStatHistory name: 'Request Processing Times'.
	requestProcessingTimeHistorys := Dictionary new.
	responseSizeHistory := MaStatHistory name: 'Response Sizes'.
	extractTimeHistory := MaStatHistory name: 'Request Upload Times'.
	timeWaitingInSocketQueueHistory := MaStatHistory name: 'Time Waiting in Socket Queue'.
	timeWaitingInRequestQueueHistory := MaStatHistory name: 'Time Waiting in Request Queue'.
	timeToSendResponsesHistory := MaStatHistory name: 'Response Upload Times'.
	clientTimeoutsHistory := MaStatHistory name: 'Failed Lifecycles'.
	numberOfClientConnectionsHistory := MaStatHistory name: 'Number of Connected Client Sockets'.
	timeToLoadBuffersHistory := MaStatHistory name: 'Time to Compress and Uncompress'.
	idleTimeHistory := MaStatHistory name: 'Server Idle Times'.
	startTime := DateAndTime now