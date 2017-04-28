accessing
associations
	"Answer a Collection containing the receiver's associations."
	| out |
	out := WriteStream on: (Array new: self size).
	self associationsDo: [:value | out nextPut: value].
	^ out contents