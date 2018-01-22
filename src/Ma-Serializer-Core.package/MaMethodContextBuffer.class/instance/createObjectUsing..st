creation
createObjectUsing: aMaObjectSerializer 
	^ MethodContext newFromFrameSize:
		(self largeFrame
			ifTrue: [ CompiledMethod fullFrameSize ]
			ifFalse: [ CompiledMethod smallFrameSize ])