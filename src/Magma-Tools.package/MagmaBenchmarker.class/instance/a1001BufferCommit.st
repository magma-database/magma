benchmarks-write
a1001BufferCommit
	"How fast can it commit when there are 1001 objects to write in each commit?"
	| count |
	count := 0.
	session abort; begin.
	self focusOn: #oneThousandElementArrayOfObjectsFixture.
	^ [ self oneThousandElementArrayOfObjectsFixture do: [ : eachArray | eachArray at: 1 put: (count := count + 1) ].
	session commitAndBegin ] bench