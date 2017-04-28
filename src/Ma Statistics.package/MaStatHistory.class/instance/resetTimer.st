private
resetTimer
	"Begin a new timer that will transition after my snapshotDuration has elapsed.  Note use of MaTimer will produce an entry in the Process browser."
	"release just in case there was a prior timer."
	self release.
	timer := MaTimer new
		name: self name ;
		in: self snapshotDuration
			do: [ self transition ].
	startTime := DateAndTime now