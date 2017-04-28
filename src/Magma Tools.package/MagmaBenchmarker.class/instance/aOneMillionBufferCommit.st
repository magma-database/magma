benchmarks-write
aOneMillionBufferCommit
	"How fast can it commit when there is a substantial buffer to write?"

	| toggle |
	toggle := false.
	session abort; begin.
	self focusOn: #oneMillionObjectPointersFixture.
	^ [ self oneMillionObjectPointersFixture do: [ : eachArray | eachArray at: 1 put: (toggle := toggle not) ].
	session commitAndBegin ] bench