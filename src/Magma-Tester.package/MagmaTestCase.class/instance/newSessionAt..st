private
newSessionAt: aMagmaLocation 
	^ aMagmaLocation newSession
		allowWriteBarrier: self class allowWriteBarrier ;
		allowLongCatchUp: true ;
		timeoutSeconds: 172800 "2 days" ;
		yourself