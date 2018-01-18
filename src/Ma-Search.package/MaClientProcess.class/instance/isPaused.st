testing
isPaused
	^ shouldPause and: [ waiterOnResume isSignaled not ]