initialize
initialize
	super initialize.
	self
		setEpoch: DateAndTime epoch
		duration: (365.24 * 1000) ceiling days
		precision: 1 minute