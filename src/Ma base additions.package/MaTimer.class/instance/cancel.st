access
cancel
	"Only allow termination while the delay is running, not while the do block is running."
	process ifNil: [ ^ self ].
	expired ifTrue: 
		[ "There's no canceling now..!"
		^ self ].
	"Don't allow process to terminate itself."
	process == Processor activeProcess ifTrue: [ MaSoftwareError signal: 'Do not cancel from this process!' ].
	monitor 
		ifNil: [ process terminate ]
		ifNotNil: [ monitor critical: [ process terminate ] ].
	process := nil