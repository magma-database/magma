accessing
allowWriteBarrier
	"Indicates whether all client sessions will be initialized with their #allowWriteBarrier: true."
	^ TestWithWriteBarrier ifNil: 
		[ self allowWriteBarrier: MagmaPreferences canEnableWriteBarrier.
		TestWithWriteBarrier ]