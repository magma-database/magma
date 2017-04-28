enumerating
selectPaths: aBlock 
	"Answer a new Tree with just my branches that at least somewhere link nodes that satisfy aBlock.  The argument to aBlock is the path of nodes to the current node."
	| newTree |
	newTree := self maOriginalClass new.
	self depthFirstDo: 
		[ : path | 
		(aBlock value: path) ifTrue: [ newTree mergePath: path ] ].
	^ newTree