actions
pause
	"Pause the running of this process, lightening cpu burden."
	self everStarted ifFalse: [ ^ self ].
	process isTerminated ifTrue: [ ^ self ].
	self isPaused ifTrue: [ ^ self ].
	self startSubtask.
	progressor description: 'pausing...'.
	shouldPause := true