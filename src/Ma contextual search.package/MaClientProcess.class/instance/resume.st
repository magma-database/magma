actions
resume
	"... when you're ready to continue."
	process isTerminated ifTrue: [ ^ self ].
	self isRunning ifTrue: [ ^ self ].
	self everStarted ifFalse: [ ^ self start ].
	progressor start.
	shouldPause ifTrue: [ [ waiterOnResume isSignaled ] whileFalse: [ waiterOnResume signal ] ].
	shouldPause := false