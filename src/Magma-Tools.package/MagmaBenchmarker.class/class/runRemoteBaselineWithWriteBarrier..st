network baseline
runRemoteBaselineWithWriteBarrier: useWriteBarrier 
	"This is a 'one-click' run of the benchmarks over a network, the results includes the network latency.
	Before running this method:
		1) Save this image.
		2) Save this image as another name (e.g., _bench-server.image).
		2.5) self startBenchmarkHost.
		3) Relaunch this image.
		4) Run this method in the relaunched image (print it!)."
	^ self
		runRemoteBaselineAgainst: 'localhost'
		withWriteBarrier: useWriteBarrier