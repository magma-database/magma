private
atRelevance: relevanceIndex add: anObject 
	self queue: anObject.
	(resultsByRelevance at: relevanceIndex) add: anObject.
	self changed