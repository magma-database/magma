performance
allowWriteBarrier: aBoolean 
	| cleanUpNeeded |
	guard critical: 
		[ transaction validateWriteBarrier: aBoolean.
		cleanUpNeeded := aBoolean not and: [ preferences allowWriteBarrier ].
		preferences allowWriteBarrier: aBoolean.
		cleanUpNeeded ifTrue: [ self cleanUpWriteBarrier ] ]