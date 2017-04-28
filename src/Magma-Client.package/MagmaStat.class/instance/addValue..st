accessing
addValue: aMagnitude 
	super addValue: aMagnitude.
	last := last asFloat.
	"Check for overflow.  Magma pulls the numbers straight from my Buffer and performs the arithmetic as a pre-write adjustment on the server, therefore I cannot support beyond the range of immediate Integers (e.g., SmallInteger range)."
	(deltaCount + count) > 1073741823 ifTrue: [ MaOverflowError signal ]