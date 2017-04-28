as yet unclassified
testTrackEquivalentInstances
	| arr arr2 arr3 |
	arr := WordArray with: 2.
	arr2 := WordArray with: 2.
	arr3 := WordArray with: 2.
	self
		 assert: arr = arr2 ;
		 deny: arr == arr2.
	self enableWriteBarrier: arr.
	self enableWriteBarrier: arr2.
	arr at: 1 put: 25.
	arr3 at: 1 put: 25.
	self assertChanged: arr.
	self denyChanged: arr2.
	self denyChanged: arr3