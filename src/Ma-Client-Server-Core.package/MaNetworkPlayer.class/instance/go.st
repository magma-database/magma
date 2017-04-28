server side
go
	| started ready |
	self ensureServerStarted.
	started := Time millisecondClockValue.
	[ (ready := self conductorKnowsImReady) or: [ (Time millisecondsSince: started) > 30000 ] ] whileFalse: [ (Delay forMilliseconds: 100) wait ].
	ready
		ifTrue: [ doBlock value ]
		ifFalse: [ MaEnvironmentError signal: 'Conductor never connected.' ]