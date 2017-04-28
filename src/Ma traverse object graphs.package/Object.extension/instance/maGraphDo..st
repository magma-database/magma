*ma traverse object graphs
maGraphDo: threeArgBlock

	self
		maGraphWhere: [ :path :parent :index | true ]
		do: threeArgBlock
