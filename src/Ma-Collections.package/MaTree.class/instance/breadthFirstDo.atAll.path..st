private
breadthFirstDo: oneArgBlock atAll: nodes path: path 
	nodes do: [ : each | 
		each ifNotNil: 
			[ path addLast: each.
			oneArgBlock value: path ] ].
	nodes ifNotEmpty: 
		[ self 
			breadthFirstDo: oneArgBlock
			atAll: (nodes 
					inject: OrderedCollection new
					into: 
						[ : coll : each | 
						coll
							addAll: (self childrenOf: each) ;
							yourself ])
			path: path ].
	path removeLast