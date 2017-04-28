as yet unclassified
testWriteBarrier
	| interval |
	interval := 3 to: 5.
	self enableWriteBarrier: interval.
	interval setFrom: 13 to: 15 by: 1.
	self assertChanged: interval