*ma traverse object graphs
maGraphDo: aBlock using: aObjectTraversalStrategy path: path with: alreadyVisitedSet

	| varIndex |

	varIndex := 1.
	self keysAndValuesDo:
		[ : eachKey : eachValue |
		[ : obj |
			self
				maValueGraphNode: obj
				index: varIndex
				using: aObjectTraversalStrategy
				with: aBlock
				path: path
				with: alreadyVisitedSet.
			varIndex := varIndex + 1 ]
				value: eachKey;
				value: eachValue ]