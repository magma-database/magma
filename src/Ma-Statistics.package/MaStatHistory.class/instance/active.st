accessing
active
	"Answer the stat that is still being tallied.  The interval (me) keeps track of the time elapsed, you just ask it for the #currentStat and add to that one."
	^ self guard critical: [ active ]