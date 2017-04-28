as yet unclassified
testNoWriteBarrier
	| point |
	point := 2@2.
	point setX: 25 setY: 25.
	self denyChanged: point