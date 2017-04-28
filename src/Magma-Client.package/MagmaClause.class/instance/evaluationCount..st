evaluating
evaluationCount: anObject 
	^ (self index indexHashesFor: anObject) count: 
		[ : each | 
		each 
			between: lowKey
			and: highKey ]