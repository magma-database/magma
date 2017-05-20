*ma-core
maReset
	"If I am already waiting, start my wait back at the beginning.  If I'm not yet waiting, no effect."
	schedulerResumptionTime := Time millisecondClockValue + millisecondDelayDuration