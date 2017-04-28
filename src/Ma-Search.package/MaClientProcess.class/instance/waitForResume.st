actions
waitForResume
	"If I am paused, wait here to resume.  I am called from within my doBlock code."
	shouldPause ifTrue: 
		[ progressor
			stop ;
			description: 'Paused.'.
		waiterOnResume wait ]