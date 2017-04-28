building
remove: anObject ifAbsent: aBlock 
	"Answers the tree of removed objects removed after removing anObject after removing it and all of its children."
	| tree |
	(self includes: anObject) ifFalse: [ ^ aBlock value ].
	self removeFromChildren: anObject.
	(tree := self treeAt: anObject) asSet do: 
		[ : each | 
		parents removeKey: each.
		children 
			removeKey: each
			ifAbsent: 
				[ "do nothing"
				 ] ].
	^ tree