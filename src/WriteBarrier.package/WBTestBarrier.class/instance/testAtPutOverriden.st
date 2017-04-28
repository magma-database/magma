as yet unclassified
testAtPutOverriden
	| array |
	array := ColorArray new: 3.
	array at: 1 put: Color red.
	self denyChanged: array.
	self enableWriteBarrier: array.
	array at: 2 put: Color blue.
	self assertChanged: array