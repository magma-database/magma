*ma-serializer-core
maValueGraphNode: anObject index: anInteger using: aObjectTraversalStrategy with: aBlock path: path with: alreadyVisitedSet 
	| stepInto obj |
	anObject == nil ifTrue: [ ^ anObject ].
	(anObject maIsMutatingProxy and: [ anObject maRealObjectIsReified not ]) ifTrue:
		[ (MaTraverseProxyNotification proxy: anObject) signal.
		^ self ].
	obj := anObject realObjectIfMutatingProxy.
	(alreadyVisitedSet includes: obj) ifTrue: [ ^ obj ].
	path add: anObject.
	stepInto := aObjectTraversalStrategy
		shouldTraverseIntoLastOf: path
		from: self
		index: anInteger.
	(aObjectTraversalStrategy
		shouldValueLastOf: path
		from: self
		index: anInteger) ifTrue:
		[ alreadyVisitedSet add: obj.
		"IMPORTANT, this needs to be here and not above.."
		aBlock
			value: path
			value: self
			value: anInteger ].
	stepInto ifTrue:
		[ obj
			maGraphDo: aBlock
			using: aObjectTraversalStrategy
			path: path
			with: alreadyVisitedSet ].
	path removeLast