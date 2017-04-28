test changed detection
verifySlyUpdate
	clientSession refresh.
	self should: [ (clientSession root at: #testChangedDetection) name = 'updated-name' ]