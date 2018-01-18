accessing
limitMaxX: aNumberOrNil 
	"Set the maximum value along the X axis.  If nil, this value will be computed from the data points to be displayed."
	limitMaxX := aNumberOrNil.
	self
		 resetCachedBoundaries ;
		 changed