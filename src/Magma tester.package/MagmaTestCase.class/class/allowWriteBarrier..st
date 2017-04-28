accessing
allowWriteBarrier: aBoolean 
	(aBoolean and: [ MagmaPreferences canEnableWriteBarrier not ]) ifTrue: [ MagmaPreferences signalCannotEnableWriteBarrier ].
	TestWithWriteBarrier := aBoolean 