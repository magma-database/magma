must override
magnification
	"Answer the factor by which the modified julian day number must be 
	multiplied in order to accomodate the clock precision"

	^ 1 second / self precision
