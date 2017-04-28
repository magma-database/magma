tests
runFullDepthKeyInsertionThenPullOut
	self
		addKeys: (64000 to: 0 by: -1) ;
		verifyIndex;
		"remove only half of them in the worst possible way and verify."
		removeKeys: (0 to: 31999) ;
		verifyIndex;
		"Remove the remaining and verify."
		removeKeys: (32000 to: 64000) ;
		verifyIndex ;
		"Now reuse some of those slots with a subset of the same key range"
		addKeys: (35000 to: 25001 by: -1) ;
		verifyIndex;
		"Add some back once again."
		removeKeys: (28001 to: 32000) ;
		verifyIndex