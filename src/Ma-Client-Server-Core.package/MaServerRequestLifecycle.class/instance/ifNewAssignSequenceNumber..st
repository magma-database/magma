accessing
ifNewAssignSequenceNumber: anInteger
	sequenceNumber ifNil: [ sequenceNumber := anInteger ]