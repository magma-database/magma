actions
pause
	"Pause the running of this process, lightening cpu burden."
	self everStarted ifFalse: [ ^ self ].
	process isTerminated ifTrue: [ ^ self ].
	self isPaused ifTrue: [ ^ self ].
	progressor description: 'pausing...'.
	"I am the controlling process (e.g., the UI process) so we can't wait here.  And we can't #suspend my process because it could be inside a critical block.  Only the client-code of my progress can call #waitForResume from a safe place."
	shouldPause := true