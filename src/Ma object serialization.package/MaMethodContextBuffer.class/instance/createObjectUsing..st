creation
createObjectUsing: aMaObjectSerializer 
	^ MethodContext basicNew:
		(self largeFrame
			ifTrue: [ CompiledMethod fullFrameSize ]
			ifFalse: [ CompiledMethod smallFrameSize ])