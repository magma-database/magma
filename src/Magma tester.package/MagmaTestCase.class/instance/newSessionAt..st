private
newSessionAt: aMagmaLocation 
	^ aMagmaLocation newSession
		allowWriteBarrier: self class allowWriteBarrier ;
		yourself