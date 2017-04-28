access
spurHeader
	"Answer whether the CompiledMethod this buffer represents should calculate its numLiterals using the new Spur way (1) or the old Cog way (0).  If the CM instance was serialized under Spur, it will be 1, otherwise 0.
	See class comment of CompiledMethod (and in a Cog image)."
	^ (self controlFields2 bitAnd: 2r00000001) = 1