*ma-core
maEnvelopes: anInterval 
	"Return true if anInterval fits entirely inside the receiver."

	^ (anInterval first between: start and: stop)
	and: [ anInterval last between: start and: stop ]