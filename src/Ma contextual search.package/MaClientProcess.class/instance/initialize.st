initialize
initialize
	shouldStop := shouldPause := false.
	waiterOnStop := Semaphore new.
	waiterOnResume := Semaphore new.
	progressor := MaProgressor new
		description: 'waiting to start' ;
		yourself