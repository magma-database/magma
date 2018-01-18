accessing
sameBuffers
	"Answer an Array of my individual MaObjectBuffers whose byteArray all share mine."
	| arg x |
	arg := Array new: self objectCount.
	x := 0.
	self buffersDo: 
		[ : each | 
		arg 
			at: (x := x + 1)
			put: each copyWithSameBuffer ].
	^ arg