accessing
limitMinX: aNumberOrNil 
	"Set the maximum value along the X axis.  If nil, this value will be computed from the data points to be displayed."
	limitMinX := aNumberOrNil.
	self
		 resetCachedBoundaries ;
		 changed