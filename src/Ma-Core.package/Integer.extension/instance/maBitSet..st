*ma-core
maBitSet: index 
	"Return the receiver with the bit at index set."
	^ self
		bitAt: index
		put: 1