performance
allowWriteBarrier: aBoolean 
	guard critical:
		[ transaction validateWriteBarrier: aBoolean.
		aBoolean
			ifTrue:
				[ preferences allowWriteBarrier ifFalse: [ transaction installWriteBarrierUsing: self ] ]
			ifFalse:
				[ preferences allowWriteBarrier ifTrue: [ self cleanUpWriteBarrier ] ].
		preferences allowWriteBarrier: aBoolean ]