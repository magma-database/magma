private
atRelevance: relevanceIndex add: anObject 
	(resultsByRelevance at: relevanceIndex) add: anObject.
	self changed