*ma-serializer-core
maBytesSize
	"Answer the size of the byte-portion of me, including the trailer bytes.  This is the number that is needed in the first argument of #newMethod:header: to reconstruct a new, CompiledMethod equivalent to me."
	^ self basicSize - self initialPC + 1