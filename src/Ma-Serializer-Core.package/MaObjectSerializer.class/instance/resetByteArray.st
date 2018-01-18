actions
resetByteArray
	"Ensure my preMade buffers share the same byteArray as my graphBuffer (a performance optimization) and set my size to 0 objects."
	preMadeObjectBuffers first byteArray ~~ self byteArray ifTrue:
		[ | ba |
		ba := self byteArray.
		preMadeObjectBuffers do:
			[ : each | each byteArray: ba ] ].
	self graphBuffer resetBufferSize