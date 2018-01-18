*ma-core
isCritical
	"Answer whether I am guarding execution of a piece of code at the moment."
self maMarked: 'delete'.
	^ semaphore isSignaled not