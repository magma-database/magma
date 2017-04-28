*ma traverse object graphs
maGraphWhere: threeArgConditionBlock do: threeArgBlock

	| strategy |

	strategy := MaObjectGraphTraversalStrategy new traverseWhen: threeArgConditionBlock.
	self
		maGraphDo: threeArgBlock
		using: strategy
