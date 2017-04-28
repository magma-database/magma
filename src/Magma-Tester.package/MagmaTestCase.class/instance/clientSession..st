test backup/restore
clientSession: aMagmaSession 
	clientSession := aMagmaSession.
	clientSession
		allowWriteBarrier: self class allowWriteBarrier ;
		immutabilityStrategy: MaImmutabilityStrategy new ;
		allowLongCatchUp: true ;
		timeoutSeconds: 172800 "2 days"