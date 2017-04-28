signaling
signalCommit: aBlock

	| result |
	self signalBegin.
	result := aBlock value.
	self signalCommit.
	^ result