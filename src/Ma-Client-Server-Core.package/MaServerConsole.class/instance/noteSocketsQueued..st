notifications
noteSocketsQueued: anInteger 
	self statistics isActive ifTrue: [ self statistics socketsQueuedHistory addValue: anInteger ]