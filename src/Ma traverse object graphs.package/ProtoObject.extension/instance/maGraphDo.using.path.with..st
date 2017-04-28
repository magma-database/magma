*ma traverse object graphs
maGraphDo: aBlock using: aObjectTraversalStrategy path: path with: alreadyVisitedSet
	"If this implementation changes, be sure to check subclasses below Collection which needed to copy this implementation."
	1
		to: self maInstSize
		do:
			[ :varIndex |
			self
				maValueGraphNode: (self instVarAt: varIndex)
				index: varIndex
				using: aObjectTraversalStrategy
				with: aBlock
				path: path
				with: alreadyVisitedSet ]
