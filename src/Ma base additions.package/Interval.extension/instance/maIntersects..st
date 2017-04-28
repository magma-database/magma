*ma base additions
maIntersects: anInterval 
	"Return true if the receiver overlaps with anInterval."

	^(start between: anInterval first and: anInterval last) 
		or: [ anInterval first between: start and: stop ]