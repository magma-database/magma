test advance
advanceAndVerify
	clientSession tryToRefreshTo: clientSession remoteCommitNumber.
	self assert: objectToAdvance first = 'object changed'