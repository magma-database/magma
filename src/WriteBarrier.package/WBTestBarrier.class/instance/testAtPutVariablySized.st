as yet unclassified
testAtPutVariablySized
	| array |
	array := WordArray new: 3.
	array at: 1 put: 42.
	self denyChanged: array.
	self enableWriteBarrier: array.
	array at: 2 put: 37.
	self assertChanged: array