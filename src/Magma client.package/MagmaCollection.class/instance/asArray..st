converting
asArray: anInteger
	| answer x size |
	answer := Array new: (size := (self size min: anInteger)).
	x := 1.
	self
		maDo: [ : each | answer at: x put: each. x := x + 1 ]
		while: [ x <= size ].
	^ answer