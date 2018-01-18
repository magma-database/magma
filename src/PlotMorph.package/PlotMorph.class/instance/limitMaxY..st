accessing
limitMaxY: aNumberOrNil
	"Set the maximum value along the Y axis.  If nil, this value will be computed from the data points to be displayed."
	limitMaxY := aNumberOrNil.
	self
		 resetCachedBoundaries ;
		 changed