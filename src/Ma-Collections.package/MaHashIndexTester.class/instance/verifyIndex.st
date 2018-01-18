private tests
verifyIndex

	self shouldnt: [ index hasAnomalies ].
	self
		verifySize;
		verifyKeys;
		verifyKeyValuePairs;
		verifyKeyQuantities;
		verifyIndexPositions ;
		verifyMidIndexAccess