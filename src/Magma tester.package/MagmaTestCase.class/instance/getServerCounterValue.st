test sequence-number generator
getServerCounterValue
	clientSession abort.
	^ (clientSession root at: #testSequenceNumberGenerator) value