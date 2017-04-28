benchmarks-read
timeToConnect
	"We do a manual #transition after every test, so allow up to 250 in the queue, none of which will be based on having transitioned due to time."
	session statistics snapshotInterval: (10 
			to: 2500
			by: 10).
	^ [ session connectAs: 'benchmarker' ] durationToRun printString