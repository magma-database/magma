accessing
addValue: aMagnitude 
	last := aMagnitude.
	self
		 adjustValues: aMagnitude ;
		 adjustExtremes: aMagnitude.
	^ aMagnitude