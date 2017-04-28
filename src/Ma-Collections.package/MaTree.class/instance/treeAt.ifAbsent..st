accessing
treeAt: anObject ifAbsent: aBlock 
	"Return a new instance of the receiver which has a single main parent anObject."
	| newTree |
	(self includes: anObject) ifFalse: [ ^ aBlock value ].
	newTree := self maOriginalClass new.
	self 
		depthFirstDo: 
			[ : path | 
			newTree 
				add: path last
				asChildOf: (path size > 1 ifTrue: [ path at: path size - 1 ]) ]
		at: anObject.
	^ newTree