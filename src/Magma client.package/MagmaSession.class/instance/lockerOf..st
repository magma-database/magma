private-magma collections
lockerOf: aMagmaCollection 
	^ self submit: 
		(MaGetMcLockerRequest new
			mcOid: (self oidFor: aMagmaCollection) ;
			yourself)