utility
dataPointToGridPoint: aPoint
	"Compute the pixel coordinates wrt the grid origin of the given data point."
	| drawBounds |
self maMarked: 'delete'.
	drawBounds := self drawBounds.
	^ (aPoint - self minPoint) * (drawBounds width @ drawBounds height negated).
