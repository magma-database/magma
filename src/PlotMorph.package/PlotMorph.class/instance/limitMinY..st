accessing
limitMinY: aNumberOrNil 
	"Set the maximum value along the X axis.  If nil, this value will be computed from the data points to be displayed."
	limitMinY := aNumberOrNil.
	self
		 resetCachedBoundaries ;
		 changed