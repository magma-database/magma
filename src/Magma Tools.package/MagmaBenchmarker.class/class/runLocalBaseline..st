quick baseline run
runLocalBaseline: useWriteBarrier 
	"This is a 'one-click' run of the benchmarks that exercises most of the Magma code without the serialization/materialization cost of Ma client server."
	| benchmarker |
	^ [ (benchmarker := self forLocalBaseline: useWriteBarrier) runAll ] ensure: [ benchmarker session disconnectAndClose ]