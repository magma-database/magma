evaluating
evaluationCount: anObject 
	^ (self index indexHashesForIndexObject: (anObject perform: attribute)) count: 
		[ : each | 
		each 
			between: lowKey
			and: highKey ]