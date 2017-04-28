initializing
initialize
	super initialize.
	self 
		signalProxyMaterializations: false ;
		allowWriteBarrier: false ;
		timeoutSeconds: 30 ;
		retrySeconds: 30 ;
		allowLongCatchUp: false