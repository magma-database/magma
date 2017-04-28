as yet unclassified
testRemove
	| arr |
	arr := WordArray with: 38.
	self enableWriteBarrier: arr.
	arr at: 1 put: 39.
	self assertChanged: arr.
	barrier remove: arr.
	self resetChanged.
	arr at: 1 put: 40.
	self denyChanged: arr