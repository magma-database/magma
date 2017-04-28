*ma traverse object graphs
maGraphDo: threeArgBlock using: anObjectTraversalStrategy
	"Walk the receiver and all of its variables valuing threeArgBlock.  The first argument is an OrderedCollection of the objects leading to the current object, including the current object, the second argument is the parent of the current object (second to last in the path).  The third argument is the index or key object required to send instVarAt: to access the current object (except for Dictionaries, in which the key may not be an Integer.  All arguments are in their substituted form."
	nil
		maValueGraphNode: self 
		index: 0
		using: anObjectTraversalStrategy 
		with: threeArgBlock
		path: OrderedCollection new 
		with: MaIdentitySet new