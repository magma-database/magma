private
requestCritical: aBlock
	"Coordinate access to all server elements."

	^requestInterruptGuard critical: aBlock