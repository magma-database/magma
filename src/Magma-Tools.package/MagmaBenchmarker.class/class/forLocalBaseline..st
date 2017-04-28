instance creation
forLocalBaseline: useWriteBarrier
	"This is a 'one-click' run of the benchmarks that exercises most of the Magma code without the serialization/materialization cost of Ma client server."

	| session |
	self resetRepository.
	session := MagmaSession openLocal: self benchName.
	session allowWriteBarrier: useWriteBarrier.
	session connectAs: 'benchTest'.
	^ self session: session