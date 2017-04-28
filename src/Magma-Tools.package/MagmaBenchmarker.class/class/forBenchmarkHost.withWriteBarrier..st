instance creation
forBenchmarkHost: hostString withWriteBarrier: useWriteBarrier 
	"This is a 'one-click' run of the benchmarks that exercises as much of the code as possible, while excluding network latency by using a hostString of 'localhost'."
	^ self 
		connectSessionTo: hostString
		useWriteBarrier: useWriteBarrier