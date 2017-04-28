test query cancel
verifyQueryCanceled: collectionOid 
	"The removal of the manager cannot occur until after the next flush.  So, wait *another* 5 seconds just to be extra sure it should have run by now."
	(Delay forSeconds: 5) wait.
	self deny: (magmaConsole controller repository hasCollectionManagerFor: collectionOid)