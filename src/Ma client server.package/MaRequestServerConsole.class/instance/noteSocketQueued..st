notifications
noteSocketQueued: aSocket 
	self statistics isActive ifTrue: [ self statistics incrementSocketsQueued ]