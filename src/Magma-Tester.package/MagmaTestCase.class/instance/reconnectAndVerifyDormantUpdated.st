test refreshAll
reconnectAndVerifyDormantUpdated
	clientSession connectAs: 'client2'.
	self should: ((dormantObject at: 1) at: 5) = 'FIVE'.
	self should: ((dormantObject at: 2) at: 5) = 'FIFTEEN'.
