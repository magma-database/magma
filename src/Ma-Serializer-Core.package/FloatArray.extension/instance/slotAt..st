*ma-serializer-core
slotAt: index
	"Clone of #at:.  Overridden for speed."
	<primitive: 'primitiveAt' module: 'FloatArrayPlugin'>
	^Float fromIEEE32Bit: (self basicAt: index)