add / remove
add: anObject 
	"Note that although a MagmaCollection can hold the same object more than once, it can only do so via separate commits."
	changes
		add: anObject
		at: (indexes collect: [ : each | each indexHashesFor: anObject ]).
	self changed: #added.
	^ anObject