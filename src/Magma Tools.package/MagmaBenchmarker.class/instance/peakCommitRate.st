benchmarks-write
peakCommitRate
	"A minimal commit-package committed over and over to see what the fastest Magma's architecture can oscillate.  This is done using auto-begin to shave the last bit of efficiency."

	| toggle |
	toggle := false.
	session abort; begin.
	self focusOn: #singleObjectFixture.
	^ [ self singleObjectFixture at: 1 put: (toggle := toggle not).
	session commitAndBegin ] bench