initialize-release
initialize
	super initialize.
	lowestKey := 0.
	highestKey := 1 bitShift: 4096.
	self resetMergedCount