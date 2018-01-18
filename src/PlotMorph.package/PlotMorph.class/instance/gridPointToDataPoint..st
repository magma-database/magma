utility
gridPointToDataPoint: aPoint
	"Compute the coordinates of the data point corresponding to the given grid point (given in pixel coordinates wrt the grid origin)."
	| drawBounds |
self maMarked: 'delete'.
	drawBounds := self drawBounds.
	^ (aPoint x @ aPoint y negated) / (drawBounds extent) + self minPoint
