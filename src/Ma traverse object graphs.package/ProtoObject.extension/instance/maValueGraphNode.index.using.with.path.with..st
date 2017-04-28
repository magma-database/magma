*ma traverse object graphs
maValueGraphNode: anObject index: anInteger using: aObjectTraversalStrategy with: aBlock path: path with: alreadyVisitedSet 
	| stepInto obj |
	anObject == nil ifTrue: [ ^ anObject ].
	obj := anObject maIsMutatingProxy
		ifTrue:
			[ anObject maRealObjectIsReified
				ifTrue: [ anObject realObjectIfMutatingProxy ]
				ifFalse:
					[ obj := (MaTraverseProxyNotification proxy: anObject) signal.
					"Never traverse or value a proxy.."
					(obj maIsMutatingProxy or: [ obj isNil ]) ifTrue: [ ^ self ].
					obj ] ]
		ifFalse: [ anObject ].
	(alreadyVisitedSet includes: obj) ifTrue: [ ^ obj ].
	path add: obj.
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