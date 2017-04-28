benchmarks-write
aOneMillionObjectPointerCommit
	"How fast can it write 1000 1000-element Arrays?"
	| toggle |
	toggle := false.
	session
		 abort ;
		 begin.
	self focusOn: #oneMillionObjectPointersFixture.
	^ [ self oneMillionObjectPointersFixture do:
		[ : eachArray | eachArray
			at: 1
			put: (toggle := toggle not) ].
	session commitAndBegin ] bench