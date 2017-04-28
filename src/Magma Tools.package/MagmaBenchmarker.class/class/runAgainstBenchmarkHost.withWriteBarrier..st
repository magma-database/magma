network baseline
runAgainstBenchmarkHost: hostString withWriteBarrier: useWriteBarrier 
	"This is a 'one-click' run of the benchmarks over a network, the results includes the network latency."
	| benchmarker |
	^ 
	[ (benchmarker := self 
		forBenchmarkHost: hostString
		withWriteBarrier: useWriteBarrier) runAll ] ensure: [ benchmarker session disconnectAndClose ]