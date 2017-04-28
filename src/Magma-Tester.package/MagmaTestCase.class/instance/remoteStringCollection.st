test forward recovery
remoteStringCollection
	clientSession abort.
	^ (clientSession root at: #testForwardRecovery) at: clientSession userId last digitValue