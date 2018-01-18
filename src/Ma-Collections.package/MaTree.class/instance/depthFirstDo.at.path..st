private
depthFirstDo: oneArgBlock at: anObject path: path 
	anObject ifNotNil: 
		[ path addLast: anObject.
		oneArgBlock value: path ].
	(self childrenOf: anObject) do: 
		[ : each | 
		self 
			depthFirstDo: oneArgBlock
			at: each
			path: path ].
	anObject ifNotNil: [ path removeLast ]