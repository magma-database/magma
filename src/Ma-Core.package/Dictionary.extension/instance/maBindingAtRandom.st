*ma-core
maBindingAtRandom
	| binding | binding := nil.
	[ binding isNil ] whileTrue: [ binding := array at: (1 to: array size) atRandom ].
	^ binding