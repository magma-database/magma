create
object: anObject traversalStrategy: aMaObjectGraphTraversalStrategy
	"Create specifying your own, customized aMaObjectGraphTraversalStrategy."
	^ (self object: anObject)
		traversalStrategy: aMaObjectGraphTraversalStrategy ;
		yourself