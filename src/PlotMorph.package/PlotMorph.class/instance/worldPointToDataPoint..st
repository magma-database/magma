utility
worldPointToDataPoint: aPoint
	"Compute the pixel coordinates of the given data point wrt the World origin."
self maMarked: 'delete'.
	^ self gridPointToDataPoint: aPoint - self gridOrigin
	