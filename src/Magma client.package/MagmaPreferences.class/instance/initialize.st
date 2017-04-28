initializing
initialize
	super initialize.
	attributes := Dictionary new.
	self 
		signalProxyMaterializations: false ;
		allowWriteBarrier: false