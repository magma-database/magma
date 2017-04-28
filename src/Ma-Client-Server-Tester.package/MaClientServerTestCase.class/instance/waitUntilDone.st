shared
waitUntilDone

	[ busy ] whileTrue: [ (Delay forSeconds: 1) wait ].
	^ nil