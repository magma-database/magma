benchmarks-write
a1001BufferCommit
	"How fast can it commit when there is a substantial buffer to write?"

	| toggle |
	toggle := false.
	session abort; begin.
	self focusOn: #oneThousandElementArrayOfObjectsFixture.
	^ [ self oneThousandElementArrayOfObjectsFixture do: [ : eachArray | eachArray at: 1 put: (toggle := toggle not) ].
	session commitAndBegin ] bench