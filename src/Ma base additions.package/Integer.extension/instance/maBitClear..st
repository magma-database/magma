*ma base additions
maBitClear: index 
	"Return the receiver with the bit at index cleared."
	^ self
		bitAt: index
		put: 0