private
initialize

	super initialize.
	self 
		epoch: DateAndTime epoch;
		duration: (365.24 * 1024) ceiling days;
		precision: 1 nanoSecond
