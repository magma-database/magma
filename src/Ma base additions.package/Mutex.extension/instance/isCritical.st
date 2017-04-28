*ma base additions
isCritical
	"Answer whether I am guarding execution of a piece of code at the moment."
	^ semaphore isSignaled not