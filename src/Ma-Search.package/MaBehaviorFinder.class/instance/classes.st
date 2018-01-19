classes
classes
	"Returns the set of classes that all methods in the receiver span."
	^ classes ifNil: 
		[ classes := Set new.
		self methods do: [ : each | each actualClass ifNotNil: [ : cls | classes add: cls ] ].
		classes := classes asSortedCollection: [ : a : b | a name < b name ] ]