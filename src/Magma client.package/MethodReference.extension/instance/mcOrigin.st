*magma client
mcOrigin
	"Answer the MCVersion in which this version of this method was originally committed."
	^ self mcModel ifNotNil: [ : mcmodel | mcmodel originOf: self ]