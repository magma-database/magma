utility
dataPointToWorldPoint: aPoint
	"Compute the pixel coordinates wrt the World origin of the given data point."
self maMarked: 'delete'.
	^ (self dataPointToGridPoint: aPoint) + self gridOrigin