private
shouldCacheAsLiteral: anObject 
	"Allow Associations too if both their key and value are literals."
	^ anObject yourself isLiteral or:
		[ anObject isVariableBinding and:
			[ (self shouldCacheAsLiteral: anObject key) and: [ self shouldCacheAsLiteral: anObject value ] ] ]