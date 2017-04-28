as yet unclassified
testSelectiveNotification
	| m |
	m := WBMock new.
	self enableWriteBarrier: m.
	self denyChanged: m.
	m lazyX.
	self assertChanged: m.
	self resetChanged.
	m lazyX.
	self denyChanged: m