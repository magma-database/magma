must override
keySize
	"Answer an Integer number of bits, in multiples of 8, that each key value can be."

	^ 128	"UUID new size * 8"