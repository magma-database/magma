classes
sortedClasses
	"Returns the set of classes that all methods in the receiver span."
	^ self classes asSortedCollection: [ : a : b | a name < b name ]