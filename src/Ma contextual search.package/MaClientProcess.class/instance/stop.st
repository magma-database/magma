actions
stop
	"Set my shouldStop flag true."
	process isTerminated ifTrue: [ ^ self ].
	shouldStop ifTrue: 
		[ "already been here, don't fork another process."
		^ self ].
	shouldStop := true.
	
	[ self resume. "Ensure running, so client will signalWaterOnStop.  Necessary even if everStarted not, because my 'process', a Process, will not get GC'd if it was never started (stays in the Process browser)."
	self isRunning ifTrue: 
		[ progressor description: 'stopping process, please wait...'.
		waiterOnStop wait ].
	progressor
		stop ;
		description: 'Stopped.'.
	process terminate ] fork