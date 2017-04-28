as yet unclassified
testVariableSelectiveNotification
	| a |
	a := WordArray with: 3.
	self enableWriteBarrier: a.
	self denyChanged: a.
	a at: 1 put: 3.
	self denyChanged: a.
	a at: 1 put: 4.
	self assertChanged: a