private
resend: priorSequenceNumber insteadOf: expectedSequenceNumber 
	(priorLifecycle notNil and: [ priorLifecycle sequenceNumber = priorSequenceNumber ])
		ifTrue: [ serverSocket sendResponseFor: priorLifecycle ]
		ifFalse: [ (MaClientServerOutOfSequence expectedSequenceNumber: expectedSequenceNumber) signal ]