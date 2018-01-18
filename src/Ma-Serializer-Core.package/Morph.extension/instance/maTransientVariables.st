*ma-serializer-core
maTransientVariables
	^ (owner == World "If serializing a live Morph in the world." or: [ self transientOwner ])
		ifTrue: [ #('owner') ]
		ifFalse: [ super maTransientVariables ]