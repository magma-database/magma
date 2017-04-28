*magma client
origin
	"Answer the MCVersion in which the receiver was originally committed."
	^ self mcModel ifNotNil: [ : model | model originOf: self ]