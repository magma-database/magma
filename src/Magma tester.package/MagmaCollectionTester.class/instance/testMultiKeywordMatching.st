testMultiKeywordMatching
testMultiKeywordMatching
	self
		remotePerform: #setUpTestMultiKeywordMatching
			in: 'client1' ;
		remotePerform: #verifyMultiKeywordQueries
			in: 'client2'