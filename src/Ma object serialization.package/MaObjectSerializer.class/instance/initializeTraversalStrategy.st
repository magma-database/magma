initializing
initializeTraversalStrategy
	traversalStrategy :=
		MaObjectGraphTraversalStrategy new
			traverseWhen:
				[ : path : parent : indexInteger | 
				path last
					maShouldTraverseWithPath: path
					parent: parent
					index: indexInteger ]