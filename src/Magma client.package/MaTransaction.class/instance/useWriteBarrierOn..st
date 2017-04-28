writebarrier
useWriteBarrierOn: anObject

	^ anObject maAllowsWriteBarrier
		and: [ session preferences allowWriteBarrier
		and: 
			[ "this only here for documentation purposes, we will never get here because classDefinitionsById is a Dictionary."
			anObject ~~ session serializer classIdManager classDefinitionsById ] ]