initialize
initialize
	shouldStop := shouldPause := false.
	waiterOnStop := Semaphore new.
	waiterOnResume := Semaphore new.
	self resetProgressor