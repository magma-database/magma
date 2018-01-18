*ma-serializer-core
maBufferInstSize
	^ (self size * 2) + "enough for other named instVars" self maInstSize - self class instSize "except tally and array"