*ma-core
maMatchesElementsOf: anotherCollection
	"Answer whether the receiver points to equivalent objects as
	anotherCollection.  In SequencableCollections, the order must be
	the same as well."

	^self maConsistsOf: anotherCollection
