access
largeFrame
	"Answer whether this MethodContext must be created with the largeFrame size."
	^ (self controlFields2 bitAnd: 2r00000001) = 1