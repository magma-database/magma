access
largeFrame: aBoolean
	"Answer whether this MethodContext must be created with the largeFrame size."
	^ self controlFields2 
		bitAt: 1 
		put: (aBoolean ifTrue: [1] ifFalse: [0])