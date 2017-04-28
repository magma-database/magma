*magma-client
isDirtyInMagma
	"If I was read from a Magma database, and I've changed since being read, answer true.  Otherwise, false."
	^ self magmaSession isDirty: self