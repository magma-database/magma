actions
traceAllPathsToAllOf: collectionOfOids
	"Answer a collection of Array's, where each Array is the path of oids, from the root, to each object in collectionOfOids."
	| set | set := collectionOfOids asSet.
	^ self traceAllWhere: [ : each | set includes: each oid]