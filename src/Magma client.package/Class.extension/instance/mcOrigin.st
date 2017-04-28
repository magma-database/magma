*magma client
mcOrigin
	"Answer the MCVersion in which this definition of this class was originally committed."
	^ self mcModel ifNotNil: [ : mcmodel | mcmodel originOf: self ]