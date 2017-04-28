benchmarks-write
peakCommitRate
	"A minimal commit-package committed over and over to see what the fastest Magma's architecture can oscillate.  This is done using auto-begin to shave the last bit of efficiency."
	| count |
	count := 0.
	session abort; begin.
	self focusOn: #singleObjectFixture.
	^ [ self singleObjectFixture at: 1 put: (count := count +1).
	session commitAndBegin ] bench