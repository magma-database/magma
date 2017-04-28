notifications
noteRequestsQueued: anInteger 
	self statistics isActive ifTrue: [ self statistics requestsQueuedHistory addValue: anInteger ]