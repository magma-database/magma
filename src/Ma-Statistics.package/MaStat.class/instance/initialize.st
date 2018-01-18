initialize
initialize
	super initialize.
	count := 0.
	"Magma requires last, sum, min and max to be floats, otherwise MaObjectBuffer>>#updateSharedValueFrom: won't work."
	last := sum := 0.0