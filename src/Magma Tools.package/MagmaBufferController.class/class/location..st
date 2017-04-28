create
location: aMagmaLocation 
	^ self session:
		(aMagmaLocation newSession
			allowWriteBarrier: MagmaPreferences canEnableWriteBarrier ;
			yourself)