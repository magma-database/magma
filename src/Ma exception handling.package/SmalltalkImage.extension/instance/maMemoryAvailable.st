*ma exception handling
maMemoryAvailable
	"Answer the remaining memory available accessible by this image."
	^ self maMaxMemory - self maMemoryUsed