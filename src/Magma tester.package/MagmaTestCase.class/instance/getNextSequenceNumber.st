test sequence-number generator
getNextSequenceNumber
	^ clientSession serverPerform: #getNextSequenceNumber