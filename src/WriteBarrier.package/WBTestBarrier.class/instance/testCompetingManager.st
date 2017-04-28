as yet unclassified
testCompetingManager
	| manager2 x y |
	manager2 := WriteBarrier new.
	x := WBMock new.
	self shouldnt: [manager2 add: x] raise: Error.
	y := WBMock new.
	self enableWriteBarrier: y.
	self should: [manager2 add: y] raise: Error
	