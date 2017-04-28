signaling
signalCommit: aBlock 
	| result |
	self signalBegin.
	result := HasMagma
		ifTrue: [ aBlock valueWhileObservingStateChange ]
		ifFalse: [ aBlock value ].
	self signalCommit.
	^ result