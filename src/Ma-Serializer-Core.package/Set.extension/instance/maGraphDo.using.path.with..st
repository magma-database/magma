*ma-serializer-core
maGraphDo: aBlock using: aObjectTraversalStrategy path: path with: alreadyVisitedSet
	"Sets and Dictionary's are enumerated logically."
	| varIndex |
	varIndex := 1.
	self do:
		[ :each |
		self
			maValueGraphNode: each
			index: varIndex
			using: aObjectTraversalStrategy
			with: aBlock
			path: path
			with: alreadyVisitedSet.
		varIndex := varIndex + 1 ]