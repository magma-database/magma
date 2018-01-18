*ma-serializer-core
maBufferInstSize
	"Answer the number of pointers to other objects I logically have (which can be fewer than the number of physical pointers due to implementation of extra growth-space)."
	^ self maInstSize