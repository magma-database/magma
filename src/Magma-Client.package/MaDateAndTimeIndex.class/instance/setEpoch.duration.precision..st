initialize
setEpoch: startingDateAndTime duration: aDuration precision: durationUnits 
	| bits |
	epoch := startingDateAndTime asUTC.
	duration := aDuration.
	precision := durationUnits.
	"The keySize is a function of the epoch, duration, and precision"
	bits := (self duration asSeconds * self magnification log: 2) ceiling.
	keySize := (bits / 8) ceiling * 8