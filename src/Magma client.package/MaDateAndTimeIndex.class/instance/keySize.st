must override
keySize
	"The keySize is a function of the epoch, duration, and precision"

	| bits |
	bits := ((self duration asSeconds * self magnification) log: 2) ceiling.
	^ (bits / 8) ceiling * 8
