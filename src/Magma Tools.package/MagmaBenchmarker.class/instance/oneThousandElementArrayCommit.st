benchmarks-write
oneThousandElementArrayCommit
	"How fast can it commit when there is a substantial buffer to write?"

	| toggle |
	toggle := false.
	session abort; begin.
	self focusOn: #oneThousandElementArrayFixture.
	^ [ self oneThousandElementArrayFixture at: 1 put: (toggle := toggle not).
	session commitAndBegin ] bench