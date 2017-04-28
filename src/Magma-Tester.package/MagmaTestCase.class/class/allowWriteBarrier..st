accessing
allowWriteBarrier: aBoolean 
	(aBoolean==true and: [ MagmaPreferences canEnableWriteBarrier not ]) ifTrue: [ MagmaPreferences signalCannotEnableWriteBarrier ].
	TestWithWriteBarrier := aBoolean 