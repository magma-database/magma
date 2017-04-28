actions
isPaused
	^ shouldPause and: [ waiterOnResume isSignaled not ]