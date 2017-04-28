notifications
noteServerShutdown
	super noteServerShutdown.
	self statistics
		release ;
		stopTime: DateAndTime now