benchmarks-write
oneThousandElementArrayCommit
	"How fast can it commit when there is a substantial buffer to write?"
	| count |
	count := 0.
	session abort; begin.
	self focusOn: #oneThousandElementArrayFixture.
	^ [ self oneThousandElementArrayFixture at: 1 put: (count := count + 1).
	session commitAndBegin ] bench